@echo off
setlocal

:: Set project root
set PROJECT_ROOT=DDoS_IaC_Project

:: Core folders
mkdir %PROJECT_ROOT%
cd %PROJECT_ROOT%

:: 1. Cloud Infrastructure & Networking
mkdir cloud_infra
cd cloud_infra
(
echo # Cloud Infra - Terraform Modules
echo # Azure VMs, Load Balancer, NSG, VNet, App Gateway
) > main.tf
copy nul variables.tf > nul
copy nul outputs.tf > nul
copy nul provider.tf > nul
cd..

:: 2. Web App and Monitoring Stack
mkdir web_monitoring_stack
cd web_monitoring_stack
mkdir nginx
copy nul nginx/nginx.conf > nul
mkdir fastapi_app
copy nul fastapi_app/app.py > nul
mkdir prometheus_grafana
copy nul prometheus_grafana/prometheus.yml > nul
copy nul prometheus_grafana/grafana_dashboards.json > nul
mkdir elk_stack
copy nul elk_stack/logstash.conf > nul
copy nul elk_stack/kibana_dashboards.json > nul
mkdir netdata
copy nul netdata/netdata.conf > nul
cd..

:: 3. DDoS Detection and Mitigation
mkdir detection_mitigation
cd detection_mitigation
mkdir ml_detection
copy nul ml_detection/train_model.py > nul
copy nul ml_detection/dataset.csv > nul
mkdir ids_ips
copy nul ids_ips/snort_rules.conf > nul
copy nul ids_ips/suricata.yaml > nul
mkdir firewall
copy nul firewall/iptables_rules.sh > nul
mkdir waf
copy nul waf/modsecurity.conf > nul
mkdir cloudflare
copy nul cloudflare/config.json > nul
cd..

:: 4. Attack Simulation and Testing
mkdir simulation_tools
cd simulation_tools
copy nul hping_test.sh > nul
copy nul slowloris_test.py > nul
copy nul loic_notes.txt > nul
copy nul jmeter_testplan.jmx > nul
copy nul tsung.xml > nul
cd..

:: 5. Automation and Recovery
mkdir automation_recovery
cd automation_recovery
copy nul block_ip.py > nul
copy nul restart_services.sh > nul
copy nul alerts_webhook.py > nul
mkdir ansible_playbooks
copy nul ansible_playbooks/firewall.yml > nul
copy nul ansible_playbooks/nginx.yml > nul
cd..

:: 6. Machine Learning Detection
mkdir ml_analysis
cd ml_analysis
copy nul model_training.ipynb > nul
copy nul traffic_analysis.py > nul
cd..

:: Optional: Docs and Diagrams
mkdir docs
mkdir diagrams
copy nul diagrams/architecture.puml > nul
copy nul diagrams/topology.png > nul
copy nul README.md > nul

cd..
echo Project scaffold created at %PROJECT_ROOT%

endlocal
pause
