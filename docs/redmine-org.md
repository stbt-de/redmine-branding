# Redmine plugin directory – Branding

Fields for the entry on https://www.redmine.org/plugins (*Register a new plugin*).
Text fields use Redmine's Textile formatting.

## Plugin Name

Branding

## Identifier

redmine_branding

## Description

Logo and favicon for Redmine – managed under *Administration → Branding*, without server access and independent of the selected theme.

* Logo in the header before the page title (on mobile before the project selector).
* Logo link: home, my page, projects or a custom address – as a default and, if users like, per user.
* Logo on the login page (can be switched off).
* Favicon that replaces the theme's.

Tested with Redmine's themes Default, Alternate and Classic, and with the "Klar theme":https://github.com/stbt-de/redmine-klar-theme. English and German.

## Homepage

https://github.com/stbt-de/redmine-branding

## Code repository

https://github.com/stbt-de/redmine-branding

## Thumbnail

`docs/thumbnail.png` (100 × 100 px; source: `docs/thumbnail.svg`)

## Installation notes

The folder in @plugins/@ must be named <code>redmine_branding</code>.

<pre>
cd /path/to/redmine/plugins
git clone https://github.com/stbt-de/redmine-branding.git redmine_branding
</pre>

Or unpack the release zip from "GitHub releases":https://github.com/stbt-de/redmine-branding/releases into @plugins/@.

Restart Redmine. No database migration is needed. Then upload logo and favicon under *Administration → Branding*.

## Plugin version

1.1.0

## Redmine compatibility

Tick: **7.0.x**, **6.1.x**, **6.0.x** (tested; see README → *Tested with*).
Not 7.1.x until it has been tested.

## Updating this entry

On a new release: on redmine.org open the plugin → *Add a version*, enter the version
and the compatible Redmine versions. Change name, description or installation notes
here first, then copy them over.
