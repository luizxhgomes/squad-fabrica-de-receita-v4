# Squad Fábrica de Receita: Guia de Ferramentas e Acessos
> Referência completa de quais ferramentas cada agent precisa, o que já está disponível
> e como configurar o que ainda falta. Gerenciamento via @devops.

---

## ESTADO ATUAL: O QUE JÁ ESTÁ DISPONÍVEL

O AIOX já tem a seguinte infraestrutura de ferramentas configurada:

| Ferramenta | Como acessar | Uso no Squad |
|-----------|-------------|--------------|
| **EXA Search** | `mcp__docker-gateway__web_search_exa` | Pesquisa de concorrentes, benchmarks, tendências de mercado |
| **Apify** | `mcp__docker-gateway__call-actor` | Scraping de redes sociais, extração de dados de anúncios |
| **Playwright** | Browser automation direto | Captura de screenshots, testes de landing pages, CRO |
| **Context7** | `mcp__docker-gateway__get-library-docs` | Documentação de APIs (GA4, Meta, HubSpot) |
| **n8n** | `mcp__claude_ai_n8n__execute_workflow` | Automações de marketing já criadas no n8n |
| **Claude Code nativo** | Read, Write, Bash, Glob, Grep | Manipulação de arquivos, scripts, análise local |

---

## MAPA DE FERRAMENTAS POR AGENT

### ⚡ Orchestrator: Growth Orchestrator
**Precisa de:** Visão consolidada de todos os pilares + dados de receita

| Ferramenta | Para que | Tier |
|-----------|---------|------|
| Google Analytics 4 API | Dados de funil consolidados | 🔴 Crítico |
| Google Looker Studio | Dashboard centralizado de todos os KPIs | 🔴 Crítico |
| n8n *(já disponível)* | Orquestrar automações entre ferramentas | 🔴 Crítico |
| EXA *(já disponível)* | Research de mercado e concorrentes | 🟢 OK |
| Slack / WhatsApp Business | Notificações de alertas críticos do sprint | 🟡 Importante |

---

### 📈 Vitor: Growth Strategist
**Precisa de:** Dados para hipóteses + análise competitiva

| Ferramenta | Para que | Tier |
|-----------|---------|------|
| EXA *(já disponível)* | Pesquisa de concorrentes, tendências | 🟢 OK |
| Apify *(já disponível)* | Scraping de anúncios e conteúdo da concorrência | 🟢 OK |
| Google Analytics 4 API | Dados de crescimento histórico | 🔴 Crítico |
| Google Sheets API | Planilhas de OKR e ICE Score | 🟡 Importante |
| Semrush / Similarweb | Análise de share of voice e tráfego | 🟡 Importante |

---

### 🎯 Hunter: Traffic Hunter
**Precisa de:** Acesso direto às plataformas de mídia paga

| Ferramenta | Para que | Tier |
|-----------|---------|------|
| Meta Ads API (Marketing API) | Criar/editar campanhas, puxar métricas de performance | 🔴 **Crítico** |
| Google Ads API | Campanhas Google Search/Display/YouTube | 🔴 **Crítico** |
| Google Analytics 4 API | Dados de conversão e atribuição | 🔴 **Crítico** |
| Google Search Console API | SEO, impressões, CTR orgânico | 🟡 Importante |
| Playwright *(já disponível)* | Screenshots de anúncios concorrentes, testes de LP | 🟢 OK |
| Apify *(já disponível)* | Facebook Ad Library scraper | 🟢 OK |
| TikTok Ads API | Campanhas TikTok (se canal ativo) | 🟠 Situacional |
| LinkedIn Ads API | Campanhas B2B (se canal ativo) | 🟠 Situacional |

---

### ✍️ Nova: Content Engine
**Precisa de:** Publicação e análise de conteúdo

| Ferramenta | Para que | Tier |
|-----------|---------|------|
| RD Station API | Email marketing, automações de nutrição | 🔴 **Crítico** |
| Buffer / Metricool API | Agendamento e analytics de social media | 🔴 Crítico |
| Apify *(já disponível)* | Análise de conteúdo de concorrentes no Instagram/LinkedIn | 🟢 OK |
| Canva API | Geração de assets visuais | 🟡 Importante |
| YouTube Data API | Analytics de conteúdo em vídeo | 🟠 Situacional |
| Typeform API | Formulários de lead magnet | 🟡 Importante |

---

### 🔄 Zara: Conversion Optimizer
**Precisa de:** Dados de comportamento e testes

| Ferramenta | Para que | Tier |
|-----------|---------|------|
| Google Analytics 4 API | Funil de conversão detalhado, eventos | 🔴 **Crítico** |
| Playwright *(já disponível)* | Testes de landing pages, screenshots comparativos | 🟢 OK |
| Hotjar / Microsoft Clarity | Heatmaps, gravação de sessão, comportamento real | 🔴 Crítico |
| Google Optimize / VWO / AB Tasty | Plataforma de A/B testing | 🟡 Importante |
| RD Station API | Taxa de conversão de formulários e fluxos | 🟡 Importante |

---

### 🏛️ Atlas: Retention Architect
**Precisa de:** CRM + dados de saúde do cliente

| Ferramenta | Para que | Tier |
|-----------|---------|------|
| HubSpot CRM API | Gestão de clientes, health score, churn tracking | 🔴 **Crítico** |
| RD Station API | Base de contatos, segmentação, NPS | 🔴 Crítico |
| Typeform / SurveyMonkey API | Pesquisas de NPS, CSAT | 🟡 Importante |
| n8n *(já disponível)* | Automações de churn prediction e alertas | 🟢 OK |
| Slack API | Alertas de clientes em risco (health score 🔴) | 🟡 Importante |

---

### 📊 Data: ROI Analyst
**Precisa de:** Acesso a todos os dados para análise cruzada

| Ferramenta | Para que | Tier |
|-----------|---------|------|
| Google Analytics 4 API | Fonte principal de dados de comportamento | 🔴 **Crítico** |
| Google Sheets API | Construção de dashboards e relatórios | 🔴 Crítico |
| Meta Ads API | Dados de ROI de campanhas pagas | 🔴 Crítico |
| Looker Studio / Data Studio | Visualização de dados consolidada | 🔴 Crítico |
| BigQuery | Análise de grandes volumes de dados | 🟠 Avançado |
| n8n *(já disponível)* | ETL de dados entre plataformas | 🟢 OK |

---

### 🤖 Aria: AI Marketing Engineer
**Precisa de:** Acesso a plataformas de automação e APIs

| Ferramenta | Para que | Tier |
|-----------|---------|------|
| n8n *(já disponível)* | Orquestração de automações complexas | 🟢 **OK (Principal)** |
| Supabase API | Banco de dados para dados de marketing | 🟡 Importante |
| OpenAI / Claude API | Geração de copy, scoring de leads com IA | 🟡 Importante |
| Make (Integromat) | Automações complementares ao n8n | 🟠 Situacional |
| Zapier | Integrações rápidas sem código | 🟠 Situacional |
| GitHub API | Versionamento de scripts de automação | 🟡 Importante |

---

### 🏭 Fabio: Fábrica de Receita Master
**Precisa de:** Dados de todo o funil de receita

| Ferramenta | Para que | Tier |
|-----------|---------|------|
| Google Analytics 4 API | Dados de funil para diagnóstico de travas | 🔴 **Crítico** |
| HubSpot CRM API | Dados de pipeline de vendas, taxas de fechamento | 🔴 Crítico |
| Google Sheets API | Construção de Clarity Reports e planos STEP | 🔴 Crítico |
| n8n *(já disponível)* | Automações do ciclo de 90 dias | 🟢 OK |
| Loom / Tella | Gravação de apresentações de diagnóstico | 🟠 Situacional |

---

### 🔓 Dara: Destrava Receita Consultant
**Precisa de:** CRM + ferramentas de proposta comercial

| Ferramenta | Para que | Tier |
|-----------|---------|------|
| HubSpot CRM API | Pipeline comercial, tracking de deals DR-X/O/T/E | 🔴 **Crítico** |
| PandaDoc / Proposify API | Geração automatizada de propostas comerciais | 🔴 Crítico |
| Calendly API | Agendamento de discovery calls | 🟡 Importante |
| Google Slides / Canva API | Geração de decks de diagnóstico | 🟡 Importante |
| EXA *(já disponível)* | Research do setor do cliente antes do pitch | 🟢 OK |
| Typeform | Formulário de qualificação pré-discovery | 🟡 Importante |

---

### 📊 Gabi: Growth Planner
**Precisa de:** Dados analíticos profundos e ferramentas de planejamento

| Ferramenta | Para que | Tier |
|-----------|---------|------|
| Google Analytics 4 API | Dados de funil, CAC por canal, conversões | 🔴 **Crítico** |
| Google Sheets API | Modelagem de CAC/LTV, ciclos de 90 dias | 🔴 Crítico |
| Meta Ads API | Dados de CAC por campanha e segmento | 🔴 Crítico |
| Looker Studio | Dashboards de ciclo de 90 dias | 🟡 Importante |
| Cohort analysis tools | Análise de coorte para LTV | 🟡 Importante |

---

### 🏛️ Rui: Revenue Team Architect
**Precisa de:** Ferramentas de comunicação e CRM

| Ferramenta | Para que | Tier |
|-----------|---------|------|
| HubSpot CRM API | Mapear silos, configurar SLAs de handoff | 🔴 **Crítico** |
| Slack API | Criar canais de Revenue Team, rituais automatizados | 🟡 Importante |
| Google Calendar API | Rituais de sincronização (Daily, Weekly, Monthly) | 🟡 Importante |
| n8n *(já disponível)* | Automações de alertas de handoff e SLA | 🟢 OK |
| Notion / Confluence API | Documentação de playbooks e SLAs | 🟠 Situacional |

---

## PLANO DE CONFIGURAÇÃO: PRIORIDADE

### 🔴 TIER 1: Crítico (Configurar Primeiro)
*Sem estas, os agents ficam com capacidade limitada*

#### 1. Google Analytics 4 (Data API v1)
**Quem usa:** Orchestrator, Hunter, Zara, Data, Fabio, Gabi
**O que desbloqueia:** Dados reais de funil para TODOS os pilares
**Como configurar:**
```bash
# 1. Acessar: console.cloud.google.com
# 2. Criar projeto GCP dedicado (ou reutilizar um projeto existente da operação)
# 3. Ativar: Google Analytics Data API
# 4. Criar Service Account → baixar JSON key
# 5. Adicionar ao.env:
GOOGLE_APPLICATION_CREDENTIALS=/path/to/service-account.json
GA4_PROPERTY_ID=properties/XXXXXXXXX
```
**MCP para adicionar via @devops:**
```
*add-mcp google-analytics
# ou via script n8n que chama GA4 API
```

---

#### 2. Meta Ads API (Facebook Marketing API)
**Quem usa:** Hunter, Data, Gabi
**O que desbloqueia:** Dados reais de CAC, ROAS, performance de campanhas
**Como configurar:**
```bash
# 1. Acessar: developers.facebook.com
# 2. Criar App → tipo "Business"
# 3. Solicitar permissões: ads_read, ads_management
# 4. Gerar Access Token de longa duração
# 5. Adicionar ao.env:
META_APP_ID=xxxxxxxxxxxx
META_APP_SECRET=xxxxxxxxxxxxxxxxxxxx
META_ACCESS_TOKEN=EAAxxxxxxxxxxxx...
META_AD_ACCOUNT_ID=act_xxxxxxxxxx
```

---

#### 3. HubSpot CRM API
**Quem usa:** Atlas, Fabio, Dara, Rui
**O que desbloqueia:** Pipeline de vendas, saúde de clientes, funil Destrava Receita
**Como configurar:**
```bash
# 1. Acessar: app.hubspot.com → Settings → Integrations → API key
# 2. Ou criar Private App com scopes:
# crm.objects.contacts.read/write
# crm.objects.deals.read/write
# crm.objects.companies.read/write
# 3. Adicionar ao.env:
HUBSPOT_API_KEY=pat-na1-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

---

#### 4. Google Sheets API
**Quem usa:** Data, Fabio, Gabi, Vitor
**O que desbloqueia:** Dashboards dinâmicos, relatórios de ROI, planejamento de ciclos
**Como configurar:**
```bash
# Usa a mesma Service Account do GA4 (se criada no mesmo projeto GCP)
# Ativar também: Google Sheets API no console.cloud.google.com
# Compartilhar a planilha com o email da Service Account
```

---

### 🟡 TIER 2: Alto Valor (Configurar na Semana 2)

#### 5. RD Station API
**Quem usa:** Nova, Atlas, Zara
**O que desbloqueia:** Email marketing, nutrição de leads, NPS automatizado
```bash
# 1. Acessar: conta RD Station → Integrations → Tokens
# 2. Gerar token da API
RDSTATION_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
RDSTATION_PUBLIC_API_KEY=xxxx
```

---

#### 6. Metricool / Buffer API
**Quem usa:** Nova
**O que desbloqueia:** Agendamento de conteúdo, analytics de social media
```bash
# Metricool: app.metricool.com → Settings → API
METRICOOL_TOKEN=xxxxxxxx
# ou Buffer: buffer.com/developers/api
BUFFER_ACCESS_TOKEN=xxxxxxxx
```

---

#### 7. Microsoft Clarity (gratuito)
**Quem usa:** Zara
**O que desbloqueia:** Heatmaps e gravações de sessão para CRO, **completamente grátis**
```bash
# 1. Acessar: clarity.microsoft.com → criar projeto
# 2. Instalar script no site
# 3. API para puxar dados:
CLARITY_PROJECT_ID=xxxxxxxx
```

---

#### 8. Calendly API
**Quem usa:** Dara
**O que desbloqueia:** Agendamento de discovery calls automatizado
```bash
# developer.calendly.com → generate token
CALENDLY_TOKEN=your-calendly-token
```

---

### 🟠 TIER 3: Escala (Configurar Conforme Necessidade)

| Ferramenta | Agent | Como obter |
|-----------|-------|-----------|
| Google Ads API | Hunter | developers.google.com/google-ads/api |
| TikTok Ads API | Hunter | developers.tiktok.com/products/ads |
| LinkedIn Ads API | Hunter | microsoft.com/en-us/advertising/pilot-programs |
| YouTube Data API | Nova | console.cloud.google.com → YouTube Data API v3 |
| Typeform API | Nova, Dara | developer.typeform.com |
| Slack API | Orchestrator, Atlas, Rui | api.slack.com/apps → criar app |
| Google Calendar API | Rui | console.cloud.google.com |
| PandaDoc API | Dara | app.pandadoc.com/a/#/integrations/api |
| WhatsApp Business API | Nova, Atlas | business.whatsapp.com/developers |
| BigQuery | Data | console.cloud.google.com → BigQuery |
| Looker Studio | Data, Gabi | gratuito via Google, sem API necessária |

---

## COMO ADICIONAR MCPs VIA @DEVOPS

Para cada ferramenta acima, delegar ao @devops:

```bash
# Ativar DevOps agent
@devops

# Comandos disponíveis para MCP:
*add-mcp {nome-da-ferramenta}
*list-mcps
*search-mcp {keyword}
```

**Exemplo de fluxo:**
```
@devops *add-mcp google-analytics
# DevOps vai guiar a configuração completa
```

---

## ARQUIVO.ENV RECOMENDADO

Nunca commitar valores reais: copie para.env local (protegido por.gitignore).

Adicionar ao `.env` do projeto (nunca commitar):

```env
# === GOOGLE / GA4 ===
GOOGLE_APPLICATION_CREDENTIALS=./service-account.json
GA4_PROPERTY_ID=properties/XXXXXXXXX
GOOGLE_SHEETS_SPREADSHEET_ID=your-spreadsheet-id

# === META ADS ===
META_APP_ID=xxxxxxxxxxxx
META_APP_SECRET=xxxxxxxxxxxxxxxxxxxx
META_ACCESS_TOKEN=EAAxxxxxxxxxxxx
META_AD_ACCOUNT_ID=act_xxxxxxxxxx

# === HUBSPOT ===
HUBSPOT_API_KEY=pat-na1-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

# === RD STATION ===
RDSTATION_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

# === METRICOOL ===
METRICOOL_TOKEN=xxxxxxxx

# === CALENDLY ===
CALENDLY_TOKEN=your-calendly-token

# === N8N (já configurado via MCP) ===
# n8n acessível via mcp__claude_ai_n8n__*

# === SLACK (opcional) ===
SLACK_BOT_TOKEN=xoxb-xxxxxxxxxx
SLACK_WEBHOOK_URL=https://hooks.slack.com/services/xxx/yyy/zzz
```

---

## FERRAMENTAS JÁ DISPONÍVEIS: USO IMEDIATO

Estas ferramentas estão 100% operacionais agora, sem nenhuma configuração adicional:

| Ferramenta | MCP / Tool | Capacidade para o Squad |
|-----------|-----------|------------------------|
| **EXA Search** | `mcp__docker-gateway__web_search_exa` | Research de concorrentes, análise de mercado, tendências, benchmarks |
| **Apify** | `mcp__docker-gateway__call-actor` | Scraping de Instagram, Facebook Ad Library, LinkedIn, TikTok |
| **Playwright** | Browser MCP | Screenshots de landing pages, testes de funil, análise de CRO visual |
| **Context7** | `mcp__docker-gateway__get-library-docs` | Documentação de APIs (GA4, Meta, HubSpot) para Aria implementar |
| **n8n** | `mcp__claude_ai_n8n__*` | Executar e criar automações de marketing |
| **WebFetch** | Nativo Claude Code | Buscar dados públicos de qualquer URL |

---

## CHECKLIST DE SETUP: POR ORDEM DE EXECUÇÃO

```
SEMANA 1 (Tier 1, Crítico):
[ ] 1. Criar projeto GCP → ativar GA4 Data API + Google Sheets API
[ ] 2. Criar Service Account + baixar JSON key
[ ] 3. Conectar GA4 Property ao projeto
[ ] 4. Criar Meta App → gerar access token
[ ] 5. Gerar HubSpot Private App token
[ ] 6. Criar.env com todas as keys do Tier 1
[ ] 7. Testar cada integração com um script simples via Aria (@ai-marketing-engineer)

SEMANA 2 (Tier 2, Alto Valor):
[ ] 8. Configurar RD Station API token
[ ] 9. Configurar Metricool ou Buffer
[ ] 10. Instalar Microsoft Clarity no site (gratuito)
[ ] 11. Configurar Calendly API
[ ] 12. Integrar tudo via n8n (Aria orquestra)

SEMANA 3+ (Tier 3, Escala):
[ ] 13. Google Ads API (quando tráfego Google for ativo)
[ ] 14. TikTok/LinkedIn Ads (quando esses canais forem ativados)
[ ] 15. Slack API para alertas automáticos do sprint
[ ] 16. PandaDoc para propostas Destrava Receita automatizadas
```

---

## HOSTINGER: Infraestrutura de Hosting & Domínios

**MCP Server:** `hostinger-mcp` (**119 ferramentas disponíveis**), registrado na configuração local de MCP do Claude Code (nível de usuário)
**API Token:** Configurado em `.env` como `HOSTINGER_API_TOKEN`
**Pacote:** `hostinger-api-mcp@latest` (via npx, instalado automaticamente)
**Quem usa:** @devops, @architect, @data-engineer, @ai-marketing-engineer

**Como usar em conversas:**
```
"Use o Hostinger MCP para criar um subdomínio campaign.exemplo.com.br"
"Liste os domínios disponíveis na conta Hostinger"
"Configure o DNS do domínio X para apontar para Y"
```

| Categoria | Capacidades |
|-----------|------------|
| **Domínios** | Listar, registrar, transferir, configurar domínios |
| **DNS** | Criar/editar registros A, CNAME, MX, TXT, NS |
| **VPS** | Criar, gerenciar, reiniciar servidores virtuais |
| **Databases** | Criar e gerenciar bancos MySQL/PostgreSQL |
| **SSL** | Emitir e renovar certificados SSL/TLS |
| **Email** | Configurar caixas de email profissionais |
| **Websites** | Gerenciar sites, domínios, configurações de hosting |
| **Billing** | Verificar planos, renovações, faturas |

**Casos de uso no squad:**
- @devops: Deploy e DNS de landing pages para campanhas de tráfego pago
- @architect: Infraestrutura para landing pages Destrava Receita (DR-X, DR-O, DR-T, DR-E)
- @ai-marketing-engineer: Automation de subdomínios para testes A/B (ex: `variant-a.produto.com`)
- @traffic-hunter: Criar subdomínios rapidamente para tracking de campanhas específicas

---

## NOTAS IMPORTANTES

1. **n8n já está conectado**: Aria pode criar e executar workflows agora mesmo
2. **EXA + Apify** cobrem 80% das necessidades de research e coleta de dados
3. **GA4 é a prioridade #1**: desbloqueia dados para 8 dos 12 agents
4. **HubSpot CRM** é o hub central para Fábrica de Receita e Destrava Receita
5. **Hostinger API** disponível para gestão de infraestrutura e domínios
6. **Nunca commitar.env**: usar `.env.example` com chaves vazias no repositório
7. **Toda configuração de MCP passa pelo @devops**: nunca diretamente por outros agents
