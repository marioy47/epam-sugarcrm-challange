# EPAM SugarCRM Challange

This is a temporary repository with code for the EPAM Challange.

The code in this repo can not be used in other projects without explicit authorization.

## Requierements

- Docker Desktop
- A valid SugarCRM licence

## Setup

- Clone the repo
- Place the SugarCRM `.zip` installer in the `./sugarinstaller/` directory
- Create a `.env` and configure it's values (Use the `.env.example` as starting point)
- Start the environment
- Go to <http://sugar.lndo.site/sugarcrm>

```bash
cd path/to/projects
git clone https://github.com/marioy47/epam-sugarcrm-challange
cd epam-sugarcrm-challange
cp path/to/installer/SugarEnt-13.0.0.zip sugarinstaller/
cp .env.example .env # Configure at least the SUGAR_LICENCE value
docker-compose up -d
```
