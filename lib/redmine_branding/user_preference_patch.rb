# frozen_string_literal: true

module RedmineBranding
  # Benutzereinstellung "Logo verlinkt auf" (Mein Konto → Einstellungen).
  # Gespeichert wie Redmines eigene Einstellungen in den "others" der
  # UserPreference; leer = Vorgabe des Admins. "custom" braucht eine gültige
  # eigene Adresse (branding_logo_link_url), sonst gilt wieder die Vorgabe.
  module UserPreferencePatch
    def self.included(base)
      base.safe_attributes 'branding_logo_link', 'branding_logo_link_url'
      base.before_save :reset_branding_logo_link_without_url
    end

    def branding_logo_link
      self[:branding_logo_link]
    end

    def branding_logo_link=(value)
      value = value.to_s
      self[:branding_logo_link] = LogoLink::USER_CHOICES.include?(value) ? value : ''
    end

    def branding_logo_link_url
      self[:branding_logo_link_url]
    end

    # Nur gültige Adressen (siehe LogoLink.valid_url?), alles andere wird leer
    def branding_logo_link_url=(value)
      value = value.to_s.strip
      self[:branding_logo_link_url] = LogoLink.valid_url?(value) ? value : ''
    end

    private

    def reset_branding_logo_link_without_url
      self[:branding_logo_link] = '' if branding_logo_link == 'custom' && branding_logo_link_url.blank?
    end
  end
end
