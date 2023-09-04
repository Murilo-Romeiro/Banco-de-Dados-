CREATE TABLE Autor (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50)
);


CREATE TABLE Categoria (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50)
);

CREATE TABLE Livro (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(100),
  autor_id INT,
  categoria_id INT,
  FOREIGN KEY (autor_id) REFERENCES Autor(id),
  FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

INSERT INTO Autor (nome) VALUES
  ('Autor 1'),
  ('Autor 2'),
  ('Autor 3'),
  ('Autor 4'),
  ('Autor 5');

INSERT INTO Categoria (nome) VALUES
  ('Ficção Científica'),
  ('Romance'),
  ('Fantasia'),
  ('Não Ficção'),
  ('Suspense');

INSERT INTO Livro (titulo, autor_id, categoria_id) VALUES
  ('Livro 1', 1, 1),
  ('Livro 2', 2, 2),
  ('Livro 3', 3, 3),
  ('Livro 4', 4, 1),
  ('Livro 5', 5, 2),
  ('Livro 6', 1, 3),
  ('Livro 7', 2, 4),
  ('Livro 8', 3, 5),
  ('Livro 9', 4, 4),
  ('Livro 10', 5, 3);

-- Buscar todos os autores
SELECT * FROM Autor;

-- Buscar livros de uma determinada categoria (gênero) cadastrada
SELECT Livro.*, Categoria.nome AS categoria
FROM Livro
JOIN Categoria ON Livro.categoria_id = Categoria.id
WHERE Categoria.nome = 'Ficção Científica';

-- Buscar livros de um determinado autor cadastrado
SELECT Livro.*, Autor.nome AS autor
FROM Livro
JOIN Autor ON Livro.autor_id = Autor.id
WHERE Autor.nome = 'Autor 1';

-- Buscar todos os livros com seus respectivos autores e categorias (gêneros)
SELECT Livro.*, Autor.nome AS autor, Categoria.nome AS categoria
FROM Livro
JOIN Autor ON Livro.autor_id = Autor.id
JOIN Categoria ON Livro.categoria_id = Categoria.id;

-- Alterar o título de um livro específico
UPDATE Livro
SET titulo = 'Novo Título'
WHERE id = 1;

-- Alterar o autor de um livro específico
UPDATE Livro
SET autor_id = 3
WHERE id = 2;

-- Alterar a categoria (gênero) de um livro específico
UPDATE Livro
SET categoria_id = 4
WHERE id = 3;

-- Excluir um livro específico
DELETE FROM Livro
WHERE id = 4;

-- Excluir um autor específico
DELETE FROM Autor
WHERE id = null;


