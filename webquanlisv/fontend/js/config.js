window.API_BASE_URL =
  localStorage.getItem('API_BASE_URL') ||
  (window.location.hostname === 'localhost'
    ? 'http://localhost:3001'
    : 'https://your-backend-url');
