📄 PRODUCT REQUIREMENTS DOCUMENT (PRD)
🏷 Product Name (Working)

PropSales AI

1️⃣ Product Overview

PropSales AI is a lightweight real estate sales management tool designed for property developers who sell plots and houses. It helps manage property inventory visually, track buyers, store media, and use AI to generate marketing content.

Target User:
Small to mid-size real estate developer (your brother).

Platform:
Web dashboard (admin only)

2️⃣ Problem Statement

Real estate developers managing plots and colonies often:

Track inventory in Excel

Manage buyers in WhatsApp

Create marketing posts manually

Forget which plots are sold/reserved

Rewrite property descriptions repeatedly

There is no simple internal system built specifically for small developers.

3️⃣ Goals for Hackathon MVP (5 Hours)

You will ONLY build:

Property Management

Colony Map Visual Inventory

Buyer Management

AI Marketing Generator

AI Property Description Generator

Anything else = future scope.

4️⃣ Core Features (MVP Scope)
4.1 Property Management
Description

Admin can create and manage properties.

Required Fields

Property Title

Colony Name

Plot Number

Size (sq ft)

Price

Status:

Available

Sold

Reserved

Description

Upload multiple images

Actions

Create property

View property list

Update status

4.2 Colony Map View (Visual Inventory)
Description

Admin uploads colony layout image and sees plot status visually.

MVP Implementation (Simple Version)

Upload colony map image

Create plots manually by:

Plot number

Status

Show grid-based or overlay-based visualization

Color coding:

Green → Available

Red → Sold

Yellow → Reserved

Click plot → open property detail page

⚠ Do NOT build complex drag-drop polygon editor.
Use simple clickable blocks mapped by plot number.

4.3 Buyer Management (Mini CRM)
Description

Track customers who purchased property.

Fields

Buyer Name

Phone

Property Purchased

Sale Price

Purchase Date

Review (text)

Actions

Add buyer

View buyers list

Link buyer to property

4.4 AI Feature 1 – Property Description Generator
User Flow

Admin clicks:
“Generate AI Description”

Input:

Size

Location

Amenities

Price category

AI Outputs:

Professional listing description

Short WhatsApp version

SEO-friendly version

4.5 AI Feature 2 – Social Media Post Generator

From property page:

Click: “Generate Marketing Post”

AI generates:

Instagram caption

Facebook post

WhatsApp message

Hashtags

Output is copy-ready.

⚠ In 5 hours, do NOT integrate real APIs.
Just generate formatted content.

5️⃣ Non-Functional Requirements

Clean dashboard UI

Mobile responsive (basic)

Fast performance

Minimal authentication (optional for MVP)

6️⃣ Tech Stack

Frontend:

Next.js / React

Backend:

Node.js API routes

Database:

Supabase / PostgreSQL

Storage:

Supabase storage (for images)

AI:

OpenAI API

7️⃣ Database Schema (Simple)
Properties Table

id

title

colony_name

plot_number

size

price

status

description

image_urls

created_at

Buyers Table

id

name

phone

property_id

sale_price

purchase_date

review

created_at

8️⃣ User Flow

Login

Add property

Upload images

View colony map

Click plot → view property

Generate AI description

Generate social media content

Add buyer when sold

9️⃣ AI Prompt Templates
Property Description Prompt

"You are a professional real estate marketing expert.
Generate a compelling property listing description.

Property details:
Size: {{size}}
Location: {{location}}
Amenities: {{amenities}}
Price: {{price}}

Generate:

Professional listing description

Short WhatsApp version

SEO optimized version"

Social Media Prompt

"You are a real estate marketing expert.

Generate:

Instagram caption

Facebook post

WhatsApp promotional message

10 relevant hashtags

Property details:
{{property_data}}"