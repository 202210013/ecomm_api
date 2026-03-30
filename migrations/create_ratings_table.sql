-- Rating System Migration for PHP Backend
-- Run this file in your MySQL database to create the ratings table

-- Use your database
USE gpshitfit_db;

-- Create ratings table
CREATE TABLE IF NOT EXISTS ratings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  user_id INT NOT NULL,
  rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
  review TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  -- Ensure one rating per order per user
  UNIQUE KEY unique_order_user (order_id, user_id),
  
  -- Indexes for better query performance
  INDEX idx_product_id (product_id),
  INDEX idx_user_id (user_id),
  INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Verify table was created
SHOW TABLES LIKE 'ratings';

-- Show table structure
DESCRIBE ratings;

SELECT 'Ratings table created successfully!' as Status;
