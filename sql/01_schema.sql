-- =============================================================================
-- E-Commerce Sales & Customer Analytics System
-- File: 01_schema.sql
-- Description: Database Schema Definition, Table DDL, Constraints & Indexes
-- Author: Roman Pavlenko
-- Target RDBMS: PostgreSQL 14+
-- =============================================================================

DROP TABLE IF EXISTS ecommerce_sales CASCADE;

CREATE TABLE ecommerce_sales (
    order_id VARCHAR(50) PRIMARY KEY,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    customer_id VARCHAR(50) NOT NULL,
    customer_name VARCHAR(100),
    customer_age INT CHECK (customer_age >= 18 AND customer_age <= 100),
    gender VARCHAR(20),
    customer_segment VARCHAR(50) NOT NULL, -- Consumer, Premium, Business, VIP
    customer_country VARCHAR(100) NOT NULL,
    customer_city VARCHAR(100),
    sales_channel VARCHAR(50) NOT NULL,    -- Mobile App, Website, Marketplace, Social Media
    campaign_name VARCHAR(100),            -- Organic Search, Google Ads, Direct, Facebook Ads, etc.
    gross_sales NUMERIC(12, 2) NOT NULL CHECK (gross_sales >= 0),
    discount_amount NUMERIC(12, 2) DEFAULT 0.00 CHECK (discount_amount >= 0),
    net_sales NUMERIC(12, 2) NOT NULL CHECK (net_sales >= 0),
    profit NUMERIC(12, 2) NOT NULL,
    order_status VARCHAR(30) NOT NULL,     -- Completed, Returned, Cancelled, Processing
    delivery_days INT CHECK (delivery_days >= 0),
    coupon_code VARCHAR(50)
);

-- Optimization Indexes for Analytics & Dashboard Performance
CREATE INDEX idx_sales_order_date ON ecommerce_sales(order_date);
CREATE INDEX idx_sales_customer_id ON ecommerce_sales(customer_id);
CREATE INDEX idx_sales_channel_campaign ON ecommerce_sales(sales_channel, campaign_name);
CREATE INDEX idx_sales_segment ON ecommerce_sales(customer_segment);
