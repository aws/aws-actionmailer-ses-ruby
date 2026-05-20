Unreleased Changes
------------------

* Feature - SESV2: forward `:list_management_options` from delivery settings to `SendEmail` as the typed `ListManagementOptions` parameter, enabling SES subscription management. Set via `config.action_mailer.ses_v2_settings` or per-mailer `delivery_method_options`.

1.1.0 (2026-03-31)
------------------

* Feature - Support injecting a preconstructed client via `:ses_client` and `:sesv2_client` options.

1.0.0 (2024-11-21)
------------------

* Feature - [Major Version] Register ActionMailers with a Railtie and allow for configuration using `config.action_mailer.ses_v2_settings` and `config.action_mailer.ses_settings`.

0.1.0 (2024-11-16)
------------------

* Feature - Initial version of this gem.
