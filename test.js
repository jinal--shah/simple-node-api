// test/routes.js
var app = require('./app');
var chai = require('chai');
var request = require('supertest');

var expect = chai.expect;

describe('API Tests', function() {
  it('health check should return OK', function(done) {
    request(app)
      .get('/health')
      .end(function(err, res) {
        expect(res.body.service).to.be.ok;
        expect(res.body.service).to.be.equal("OK");
        expect(res.statusCode).to.be.equal(200);
        done();
      });
  });

  it('message should return "hello world" in spanish', function(done) {
    request(app)
      .get('/message')
      .end(function(err, res) {
        expect(res.body.message).to.be.ok;
        expect(res.body.message).to.be.equal("hola mundo");
        expect(res.statusCode).to.be.equal(200);
        done();
      });
  });

  it('unknown endpoint should return 404', function(done) {
    request(app)
      .get('/does-not-exist')
      .end(function(err, res) {
        expect(res.statusCode).to.be.equal(404);
        done();
      });
  });
});
