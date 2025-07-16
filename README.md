# jaffle_shop dbt Project

Welcome to the **jaffle_shop** dbt project!  
This project demonstrates best practices for analytics engineering using [dbt](https://www.getdbt.com/).

---

## 🚀 Getting Started

### Prerequisites

- [dbt Core](https://docs.getdbt.com/docs/installation) installed locally
- Access to your data warehouse
- A configured `profiles.yml` in your `~/.dbt/` directory

### Setup

1. **Clone the repository**
   ```sh
   git clone <your-repo-url>
   cd jaffle_shop
   ```

2. **Install dependencies**
   ```sh
   dbt deps
   ```

3. **Test your connection**
   ```sh
   dbt debug
   ```

4. **Run the project**
   ```sh
   dbt run
   ```

5. **Test your models**
   ```sh
   dbt test
   ```

---

## 🗂️ Project Structure

- `models/` - Your dbt models (SQL transformations)
- `seeds/` - CSV files loaded as tables
- `macros/` - Custom Jinja macros
- `snapshots/` - Snapshots for slowly changing dimensions
- `analyses/` - Ad-hoc analysis queries
- `tests/` - Custom data tests

---

## 📚 Resources

- [dbt Documentation](https://docs.getdbt.com/docs/introduction)
- [dbt Discourse](https://discourse.getdbt.com/)
- [dbt Community](https://getdbt.com/community)
- [dbt Events](https://events.getdbt.com)
- [dbt Blog](https://blog.getdbt.com/)

---

## 🤝 Contributing

Contributions are welcome! Please open issues or pull requests for improvements or questions.

---

## 📝 License

This project is licensed under the