document.getElementById('fetchData').addEventListener('click', () => {
    console.log('Button clicked, sending request to backend...');

    fetch('http://192.168.49.2:30001/data')  // Test with the correct URL
        .then(response => {
            console.log('Response received:', response);
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json();
        })
        .then(data => {
            console.log('Data received from backend:', data);
            document.getElementById('result').textContent = JSON.stringify(data);
        })
        .catch(error => {
            console.error('Fetch error:', error);
        });
});

