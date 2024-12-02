const request = require('supertest');
const app = require('../src/app');

describe('GET /', () => {
    it('should return a JSON response with "Hello, World!"', async () => {
        const response = await request(app).get('/');
        expect(response.statusCode).toBe(200);
        expect(response.body.message).toBe('Hello, World!');
    });
});
