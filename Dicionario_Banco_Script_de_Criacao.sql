-- Criação da tabela de usuários no PostgreSQL
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    password VARCHAR(255), -- tamanho maior para hash seguro
    cpf VARCHAR(14) NOT NULL UNIQUE,
    register VARCHAR(45) NOT NULL UNIQUE, -- matrícula
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- Criação da tabela de categorias no PostgreSQL
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    title VARCHAR(45) NOT NULL,
    description VARCHAR(200) NOT NULL
);

-- Criação da tabela de materiais no PostgreSQL
CREATE TABLE materials (
    id SERIAL PRIMARY KEY,
    title VARCHAR(45) NOT NULL,
    description VARCHAR(200) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    category_id INT NOT NULL,
    amount INT NOT NULL,
    minimum_stock INT NOT NULL,
    available INT NOT NULL,
    CONSTRAINT fk_material_category FOREIGN KEY (category_id)
        REFERENCES categories (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-- Criação da tabela de pedidos (orders) no PostgreSQL
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    order_status VARCHAR(45),
    author_id INT,
    CONSTRAINT fk_order_author FOREIGN KEY (author_id)
        REFERENCES users (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-- Índice para otimizar consultas por autor
CREATE INDEX idx_order_author ON orders (author_id);

-- Criação da tabela de movimentações de pedidos (order_movements) no PostgreSQL
CREATE TABLE order_movements (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    movement_type VARCHAR(45) NOT NULL, -- tipo da movimentação (Delivery/Return)
    storekeeper_id INT NOT NULL,        -- almoxarife responsável
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_order_movement_order FOREIGN KEY (order_id)
        REFERENCES orders (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT fk_order_movement_storekeeper FOREIGN KEY (storekeeper_id)
        REFERENCES users (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-- Índices para otimizar consultas
CREATE INDEX idx_order_movement_order ON order_movements (order_id);
CREATE INDEX idx_order_movement_storekeeper ON order_movements (storekeeper_id);

