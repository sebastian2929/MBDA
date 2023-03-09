/* Crear las tablas */
Create Table ProductCategory(
    ProductCategoryID NUMBER(10) NOT NULL,
    ParentProductCategory NUMBER(4),
    NameP VARCHAR(15) NOT NULL
);

Create Table ProductModel(
    ProductModelID NUMBER(10) NOT NULL,
    NameP NUMBER(4)NOT NULL
);

Create Table ProductModelProductDescription(
    ProductModelID NUMBER(10) NOT NULL,
    ProductDescriptionID NUMBER(4)NOT NULL,
    Culture VARCHAR(10)
);

Create Table Product(
    ProductID NUMBER(38) NOT NULL,
    Namep VARCHAR(30),
    Color VARCHAR(15),
    ListPrice NUMBER(4),
    Size_P NUMBER(20),
    Weight NUMBER(20),
    ProductModelID NUMBER(38),
    ProductCategoryID NUMBER(38)
);

/* Relacionar las tablas */
    /* Claves PK */
ALTER TABLE ProductADD CONSTRAINT PK_Product PRIMARY KEY(ProductID);
ALTER TABLE ProductModel ADD CONSTRAINT PK_ProductModel PRIMARY KEY(ProductModelID);
ALTER TABLE ProductModelProductDescription ADD CONSTRAINT PK_ProductModelProductDescription PRIMARY KEY(ProductID);
ALTER TABLE ProductCategory ADD CONSTRAINT PK_ProductCategory PRIMARY KEY(ProductCategoryID);

    /* Claves UK */
ALTER TABLE Product ADD CONSTRAINT UK_Product UNIQUE (ProductID);
ALTER TABLE ProductModelProductDescription ADD CONSTRAINT UK_Product UNIQUE (Culture);

    /* Cleaves FK */
ALTER TABLE Product 
    ADD CONSTRAINT FK_Product 
    FOREIGN KEY(ProductModleID) 
    references ProductModel(ProductModelID);
ALTER TABLE ProductModel 
    ADD CONSTRAINT FK_Product 
    FOREIGN KEY(ProductModleID) 
    references ProductModelDescription(ProductModelID);
ALTER TABLE ProductCategory
    ADD CONSTRAINT FK_Product
    FOREIGN KEY(ProductCategoryID)
    references Product(ProductCategoryID);