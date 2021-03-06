const express = require('express');
const app = express();

function getPosts() {
  return [{
    id: 0,
    author: 'John Doe',
    title: 'First title',
    body: 'First body'
  }, {
    id: 1,
    author: 'Jane Doe',
    title: 'Second title',
    body: 'Second body'
  }];
}

app.use(express.static('assets'));

app.get('/api/posts', (req, res) => res.json(getPosts()));
app.get('/api/post/:id', (req, res) => {
  const { id } = req.params;
  const post = getPosts().find(p => p.id === Number(id));
  if (post) {
    return res.status(200).send(post);
  }
  return res.status(404).send('Not Found');
});

app.get('/api/*', (req, res) => res.status(404).send('Not Found'));

app.get('*', (req, res) => {
  res.sendFile(__dirname + '/assets/index.html');
});

const server = app.listen(3000, () => {
  const host = server.address().address;
  const port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
