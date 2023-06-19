function initMap() {
    var lat = parseFloat(document.getElementById('lat').textContent);
    var lng = parseFloat(document.getElementById('lng').textContent);

    var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: lat, lng: lng},
        zoom: 12
    });
    var marker = new google.maps.Marker({
        position: {lat: lat, lng: lng},
        map: map
    });
}

function geocodeAddress(address) {
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({address: address}, function(results, status) {
        if (status === 'OK') {
            var lat = results[0].geometry.location.lat();
            var lng = results[0].geometry.location.lng();

            document.getElementById('lat').textContent = lat;
            document.getElementById('lng').textContent = lng;

            initMap();
        } else {
            alert('La geocodificación no pudo completarse debido a: ' + status);
        }
    });
}

function searchAddress(address) {
    var userAddress = "{{ usuario_ficha.dirreccion_usuario }}";  // Obtener la dirección del usuario desde el modelo
    if (userAddress === address) {
        Swal.fire('¡Dirección encontrada!', 'La dirección coincide con la dirección del usuario', 'success');
        // Realizar las acciones adicionales que desees si la dirección coincide
    } else {
        Swal.fire('¡Dirección no encontrada!', 'La dirección no coincide con la dirección del usuario', 'error');
        // Realizar las acciones adicionales que desees si la dirección no coincide
    }
}