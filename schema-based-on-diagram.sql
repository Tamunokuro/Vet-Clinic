CREATE TABLE patients (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status VARCHAR(50) NOT NULL
);

ALTER TABLE medical_histories 
ADD FOREIGN KEY (patient_id) REFERENCES patients (id);


CREATE TABLE treatments (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(20) NOT NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE invoices (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL(5,2) NOT NULL,
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    payed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE invoices
ADD FOREIGN KEY (medical_history__id) REFERENCES medical_histories (id);

CREATE TABLE invoice_items (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL(2,2) NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(6,2) NOT NULL
);

ALTER TABLE invoice_items
ADD FOREIGN KEY (invoice_id) REFERENCES invoices (id);

ALTER TABLE invoice_items
ADD FOREIGN KEY (treatment_id) REFERENCES treatments (id);


