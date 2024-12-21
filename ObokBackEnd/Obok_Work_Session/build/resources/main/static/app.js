// app.js
document.getElementById('postForm').addEventListener('submit', async (event) => {
    event.preventDefault();

    const title = document.getElementById('title').value;
    const content = document.getElementById('content').value;

    const postData = { title, content };

    try {
        const response = await fetch('http://localhost:8080/post', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(postData),
        });

        if (response.ok) {
            alert('Post created successfully!');
        } else {
            alert('Failed to create post');
        }
    } catch (error) {
        console.error('Error:', error);
        alert('Error occurred while creating post');
    }
});
