import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });

    this.addMarkersToMap();
    this.fitMapToMarkers();
    this.selectedMarkers = [];

    this.map.on("click", e => {
      const features = this.map.queryRenderedFeatures(e.point, {
        layers: ['markers']
      });

      if (features.length > 0) {
        const marker = features[0];
        if (this.selectedMarkers.length < 2) {
          marker.properties.selected = !marker.properties.selected;
          this.selectedMarkers = this.map.queryRenderedFeatures({
            layers: ['markers'],
            filter: ["==", "selected", true]
          });

          if (this.selectedMarkers.length === 2) {
            this.getDirections(this.selectedMarkers[0], this.selectedMarkers[1]);
          }
        }
      } else {
        this.selectedMarkers = [];
      }
    });
  }

  addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const element = document.createElement('div');
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);

      element.className = 'marker';
      element.style.backgroundImage = `url(${marker.image_url})`;

      new mapboxgl.Marker(element)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
        .setProperties({ id: marker.id });
    });
    this.map.addLayer({
      id: 'markers',
      type: 'symbol',
      source: {
        type: 'geojson',
        data: {
          type: 'FeatureCollection',
          features: this.markersValue.map(marker => {
            return {
              type: 'Feature',
              geometry: {
                type: 'Point',
                coordinates: [marker.lng, marker.lat]
              },
              properties: {
                id: marker.id,
                selected: false
              }
            }
          })
        }
      },
      layout: {
        'icon-image': 'marker',
        'text-field': ['get', 'title'],
        'text-font': ['Open Sans Semibold', 'Arial Unicode MS Bold'],
        'text-offset': [0, 1.25],
        'text-anchor': 'top'
      },
      paint: {
        'text-color': '#6AA84F',
        'text-halo-color': '#fff',
        'text-halo-width': 2
      }
    });
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 50, maxZoom: 50, duration: 0 });
  }

  getDirections(start, end) {
    // Call Mapbox Navigation API to get route between the two markers
    const startCoords = start.geometry.coordinates;
    const endCoords = end.geometry.coordinates;

    fetch(`https://api.mapbox.com/directions/v5/mapbox/driving/${startCoords[0]},${startCoords[1]};${endCoords[0]},${endCoords[1]}?steps=true&access_token=${mapboxgl.accessToken}`)
      .then(response => response.json())
      .then(data => {
        console.log(data);
        const route = data.routes[0].geometry.coordinates;
        this.map.addLayer({
          id: 'route',
          type: 'line',
          source: {
            type: 'geojson',
            data: {
              type: 'Feature',
              geometry: {
                type: 'LineString',
                coordinates: route
              }
            }
          },
          paint: {
            'line-color': '#31708E',
            'line-width': 8
          }
        });
      });
  }
}
```
