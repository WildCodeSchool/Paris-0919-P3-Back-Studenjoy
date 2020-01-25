const jwt = require('jsonwebtoken');

const auth = (req, res, next) => {
  try {
    const token = req.header('Authorization').replace('Bearer ', '');
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    if (decoded) {
      req.id = decoded.student.id;
    }
    next();
  } catch (e) {
    console.log(e);
    res.status(401).send({ error: 'Please authenticate' });
  }
};

module.exports = auth;
