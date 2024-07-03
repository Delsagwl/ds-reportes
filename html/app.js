document.getElementById('enviar-reporte').addEventListener('click', async function() {
    const reportText = document.getElementById('texto-reporte').value;
    const reportType = document.getElementById('tipo-reporte').value;
    const errorMessage = document.getElementById('mensaje-error');

    // Validar la longitud del reporte
    if (reportText.length < 10 || reportText.length > 500) {
        errorMessage.style.display = 'block';
        return;
    }

    fetch(`https://${GetParentResourceName()}/enviar`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({
            text: reportText,
            type: reportType
        })
    }).then(response => response.json()).then(data => {
        document.getElementById('texto-reporte').value = '';
        document.getElementById('tipo-reporte').selectedIndex = 0;
        errorMessage.style.display = 'none';
        fetch(`https://${GetParentResourceName()}/enviar`);
    });
});

window.addEventListener('message', function(event) {
    if (event.data.type === 'open') {
        document.body.style.display = 'flex';
        document.getElementById('mensaje-error').style.display = 'none';
    } else if (event.data.type === 'close') {
        document.body.style.display = 'none';
        document.getElementById('mensaje-error').style.display = 'none';
    }
});

document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        fetch(`https://${GetParentResourceName()}/cerrar`);
    }
});