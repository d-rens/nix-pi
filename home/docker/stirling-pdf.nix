{
  config,
  ...
}:
{
  home.file = {
    "docker/pdf/docker-compose.yml".text = ''
      services:
        stirling-pdf:
          container_name: Stirling-PDF
          image: frooodle/s-pdf:latest
          deploy:
            resources:
              limits:
                memory: 3G
          healthcheck:
            test: ["CMD-SHELL", "curl -f http://localhost:8049/api/v1/info/status | grep -q 'UP' && curl -fL http://localhost:8049/ | grep -qv 'Please sign in'"]
            interval: 5s
            timeout: 10s
            retries: 16
          ports:
            - "8049:8080"
          volumes:
            - /mnt/data/stirling/latest/data:/usr/share/tessdata:rw
            - /mnt/data/stirling/latest/config:/configs:rw
            - /mnt/data/stirling/latest/logs:/logs:rw
          environment:
            DOCKER_ENABLE_SECURITY: "false"
            SECURITY_ENABLELOGIN: "false"
            LANGS: "en_US"
            SYSTEM_DEFAULTLOCALE: en-US
            UI_APPNAME: Stirling-PDF
            UI_HOMEDESCRIPTION: Demo site for Stirling-PDF Latest
            UI_APPNAMENAVBAR: Stirling-PDF Latest
            SYSTEM_MAXFILESIZE: "100"
            METRICS_ENABLED: "true"
            SYSTEM_GOOGLEVISIBILITY: "true"
          restart: on-failure:5
    '';
  };
}
