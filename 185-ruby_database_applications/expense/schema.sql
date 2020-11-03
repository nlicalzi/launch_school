CREATE TABLE expenses (
  id serial PRIMARY KEY,
  amount numeric(7,2) NOT NULL,
  memo text NOT NULL,
  created_on date NOT NULL DEFAULT CURRENT_DATE
);

ALTER TABLE expenses ADD CONSTRAINT positive_expense CHECK (amount > 0);