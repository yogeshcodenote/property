# PropSales AI - Real Estate Sales Management System

PropSales AI is a lightweight real estate sales management tool designed for property developers who sell plots and houses. It helps manage property inventory visually, track buyers, store media, and use AI to generate marketing content.

## Features

### Property Management
- Create and manage properties with details like title, colony name, plot number, size, and price
- Track property status: Available, Sold, or Reserved
- Upload multiple images per property
- View property listings in a clean table format

### Colony Map View (Visual Inventory)
- View properties grouped by colony
- Color-coded plot status visualization:
  - 🟢 Green → Available
  - 🔴 Red → Sold
  - 🟡 Yellow → Reserved
- Click on any plot to view property details
- Statistics dashboard for each colony

### Buyer Management (Mini CRM)
- Track customers who purchased property
- Store buyer information: name, phone, property, sale price, purchase date
- Add customer reviews
- Quick contact via WhatsApp or phone call

### AI Property Description Generator
- Generate professional listing descriptions
- Create short WhatsApp-friendly versions
- SEO-optimized descriptions for online listings

### AI Social Media Post Generator
- Instagram captions
- Facebook posts
- WhatsApp promotional messages
- Relevant hashtags

## Tech Stack

- **Framework:** Ruby on Rails 8.0
- **Database:** PostgreSQL
- **Frontend:** Bootstrap 5, Hotwire (Turbo + Stimulus)
- **Storage:** Active Storage
- **CSS:** Sass/SCSS

## Getting Started

### Prerequisites

- Ruby 3.4.1
- PostgreSQL
- Node.js & Yarn

### Installation

1. Clone the repository:
```bash
cd /home/yogesh/projects/property
```

2. Install dependencies:
```bash
bundle install
yarn install
```

3. Set up the database:
```bash
bin/rails db:create db:migrate
```

4. Start the development server:
```bash
bin/dev
```

5. Open your browser and visit:
```
http://localhost:3000
```

## Usage

1. **Add a Property:** Click "New Property" from the navigation bar
2. **View Colony Map:** Navigate to "Colony Map" to see visual inventory
3. **Add a Buyer:** When a property is sold, add buyer information from the Buyers section
4. **Generate AI Content:** From any property page, use AI Tools to generate descriptions and social media posts

## Project Structure

```
├── app/
│   ├── controllers/
│   │   ├── properties_controller.rb
│   │   ├── buyers_controller.rb
│   │   ├── dashboard_controller.rb
│   │   ├── colony_map_controller.rb
│   │   └── ai_generator_controller.rb
│   ├── models/
│   │   ├── property.rb
│   │   └── buyer.rb
│   └── views/
│       ├── properties/
│       ├── buyers/
│       ├── dashboard/
│       ├── colony_map/
│       └── ai_generator/
├── db/
│   ├── migrate/
│   └── schema.rb
└── config/
    ├── routes.rb
    └── database.yml
```

## Database Schema

### Properties Table
- id, title, colony_name, plot_number
- size (decimal), price (decimal)
- status (available/sold/reserved)
- description (text)
- timestamps

### Buyers Table
- id, name, phone
- property_id (foreign key)
- sale_price (decimal), purchase_date (date)
- review (text)
- timestamps

## License

This project is proprietary software.

## Support

For questions or support, please contact the development team.
