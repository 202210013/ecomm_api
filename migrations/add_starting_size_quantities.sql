-- Add starting_size_quantities column to products table
-- This column stores the initial stock quantities for each size to calculate sold items

ALTER TABLE products 
ADD COLUMN starting_size_quantities JSON NULL AFTER size_quantities;

-- Update existing products to set starting_size_quantities equal to current size_quantities
UPDATE products 
SET starting_size_quantities = size_quantities 
WHERE size_quantities IS NOT NULL;
