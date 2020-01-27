const jwt = require('jsonwebtoken');

const auth = (req, res, next) => {
  try {
    const token = req.header('Authorization').replace('Bearer ', '');
    console.log('token', token);
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    if (decoded) {
      console.log('req id:', decoded.id);
      req.id = decoded.id;
    }
    next();
  } catch (e) {
    console.log(e);
    res.status(401).send({ error: 'Please authenticate' });
  }
};

module.exports = auth;
