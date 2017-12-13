-- Plugins path gets uncommented during jitsi-meet-tokens package install - that's where token plugin is located
--plugin_paths = { "/usr/share/jitsi-meet/prosody-plugins/" }

VirtualHost "mircea.docker.ro"
        -- enabled = false -- Remove this line to enable this host
        authentication = "anonymous"
        -- Properties below are modified by jitsi-meet-tokens package config
        -- and authentication above is switched to "token"
        --app_id="example_app_id"
        --app_secret="example_app_secret"
        -- Assign this host a certificate for TLS, otherwise it would use the one
        -- set in the global section (if any).
        -- Note that old-style SSL on port 5223 only supports one certificate, and will always
        -- use the global one.
        ssl = {
                key = "/etc/prosody/certs/mircea.docker.ro.key";
                certificate = "/etc/prosody/certs/mircea.docker.ro.crt";
        }
        -- we need bosh
        modules_enabled = {
            "bosh";
            "pubsub";
            "ping"; -- Enable mod_ping
        }

        c2s_require_encryption = false

Component "conference.mircea.docker.ro" "muc"
    storage = "null"
    --modules_enabled = { "token_verification" }
admins = { "focus@auth.mircea.docker.ro" }

Component "jitsi-videobridge.mircea.docker.ro"
    component_secret = "Cbl6qpx9"

VirtualHost "auth.mircea.docker.ro"
    ssl = {
        key = "/etc/prosody/certs/auth.mircea.docker.ro.key";
        certificate = "/etc/prosody/certs/auth.mircea.docker.ro.crt";
    }
    authentication = "internal_plain"

Component "focus.mircea.docker.ro"
    component_secret = "xDMfjSDW"
