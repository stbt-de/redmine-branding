# frozen_string_literal: true

# Branding – Logo und Favicon für Redmine, unabhängig vom Theme
#
#   Logo im Kopf      vor dem Seitentitel; Linkziel als Vorgabe des Admins,
#                     auf Wunsch je Benutzer (Mein Konto)
#   Anmeldeseite      Logo über dem Login-Formular (abschaltbar)
#   Favicon           ersetzt das Favicon des Themes
#
# Einstellungen unter Administration → Branding.

Redmine::Plugin.register :redmine_branding do
  name 'Branding'
  author 'stbt.de'
  author_url 'https://stbt.de/'
  description 'Logo im Kopf, Logo auf der Anmeldeseite und Favicon – für jedes Theme.'
  version '1.1.0'
  url 'https://github.com/stbt-de/redmine-branding'
  requires_redmine version_or_higher: '6.0.0'

  # Gespeichert wird über Setting.plugin_redmine_branding. Bewusst ohne
  # :partial – Redmines generisches Einstellungsformular würde beim Speichern
  # den ganzen Hash ersetzen und hochgeladene Dateien verwerfen. Die
  # Einstellungen haben deshalb eine eigene Seite in der Administration.
  settings default: {
    'logo' => nil, 'favicon' => nil, 'login_logo' => '1',
    'logo_link' => 'my_page', 'logo_link_url' => ''
  }

  menu :admin_menu, :redmine_branding,
       { controller: 'branding_settings', action: 'show' },
       caption: :label_branding,
       icon: 'photo',
       html: { class: 'icon icon-photo' }
end

# Hook-Klasse laden, damit sie sich bei Redmine registriert (Zeitwerk lädt
# lib/ nur bei Bedarf), das Favicon für alle Seiten umstellen und die
# Benutzereinstellung "Logo verlinkt auf" ergänzen
RedmineBranding::Hooks
ApplicationHelper.prepend(RedmineBranding::FaviconHelper) unless ApplicationHelper < RedmineBranding::FaviconHelper
UserPreference.include(RedmineBranding::UserPreferencePatch) unless UserPreference < RedmineBranding::UserPreferencePatch
