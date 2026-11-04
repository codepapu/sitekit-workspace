# Sitekit Workspace

Liferay DXP workspace that ships **`sitekit-initializer`** — a Site Initializer client extension for the **Sitekit** demo site (courses, classrooms, blog, commerce catalog, templates, and more).

## Requirements

- Liferay DXP 2026.q3.8 (see `../liferay-dxp`)
- Java 17+
- Blade / Gradle wrapper included

## Deploy

```bash
cd sitekit-workspace
./gradlew :client-extensions:sitekit-initializer:clean \
  :client-extensions:sitekit-initializer:deploy
```

Then create a site from **Sitekit Initializer** in the Sites UI.

## Brand

Site name, logos, fragments, style books, commerce catalog, and DDM templates use the **Sitekit** brand.
# sitekit-workspace
