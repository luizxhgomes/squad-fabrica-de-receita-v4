---
task: AI Marketing Automation Blueprint
responsavel: "@ai-marketing-engineer"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - processo_manual: Processo de marketing que será automatizado
  - ferramentas_atuais: Stack de ferramentas existente
  - objetivo: Objetivo da automação (escala, eficiência, personalização)
Saida: |
  - automation_blueprint: Blueprint da automação
  - stack_recommendation: Stack de ferramentas recomendada
  - implementation_roadmap: Roadmap de implementação
  - roi_estimate: Estimativa de ROI da automação
Checklist:
  - "[ ] Processo AS-IS documentado com custos atuais"
  - "[ ] Blueprint TO-BE com triggers e acoes definidos"
  - "[ ] Stack de ferramentas recomendada e justificada"
  - "[ ] ROI da automacao estimado com payback"
elicit: true
---

# *ai-automation-plan: Blueprint de Automação AI-First

Inspirado no Mkt.Lab da a assessoria: automatizar o manual, escalar o que funciona,
usar IA como sistema nervoso central do marketing.

## Princípio Mkt.Lab

```
Processo Manual Hoje → Automação com IA → Humano valida apenas exceções
                     → Dados coletados → IA fica mais inteligente ao longo do tempo
```

## Template de Blueprint

```markdown
# AI Automation Blueprint: [Nome do Processo]

## Situação Atual (AS-IS)
- Processo: [descrição do que é feito manualmente]
- Tempo gasto: [horas/semana]
- Custo atual: [R$ em pessoa/hora]
- Erros frequentes: [problemas do processo manual]

## Visão Automática (TO-BE)
- Trigger: [o que dispara a automação]
- Ação: [o que a IA faz]
- Output: [resultado da automação]
- Exceção: [quando o humano precisa intervir]

## Stack de Ferramentas
- Plataforma de automação: [HubSpot / Make / n8n / ActiveCampaign]
- IA utilizada: [Claude API / OpenAI / modelo custom]
- Fonte de dados: [CRM / GA4 / Ads Platform / CDP]
- Output/destino: [onde os resultados vão]

## ROI da Automação
- Horas economizadas/semana: [X horas × R$/hora = R$/semana]
- Erros evitados: [impacto estimado em receita]
- Escala habilitada: [volume que não era possível manualmente]
- Payback: [em meses]

## Roadmap de Implementação
Fase 1 (Semana 1-2): [configuração base]
Fase 2 (Semana 3-4): [integração de dados]
Fase 3 (Semana 5-6): [ativação e testes]
Fase 4 (Semana 7+): [monitoramento e otimização]
```

## Automações AI-First Prioritárias por Pilar

### Tráfego
1. **Bid optimization automático**: IA ajusta lances em tempo real por ROAS alvo
2. **Creative testing at scale**: IA gera variações de copy/criativos, testa e mata perdedores
3. **Audience expansion**: Lookalike dinâmico baseado em clientes de alto LTV

### Engajamento
1. **Email personalization**: Conteúdo dinâmico por segmento e comportamento
2. **Send-time optimization**: IA descobre o melhor horário por usuário
3. **Lead scoring automático**: Pontuação de leads por comportamento em tempo real

### Conversão
1. **Chatbot de qualificação**: Qualifica leads 24/7 antes do humano
2. **Dynamic CTAs**: CTA muda conforme o perfil do visitante
3. **Abandonment recovery**: Sequência automática pós-abandono de formulário/carrinho

### Retenção
1. **Churn prediction**: Alerta quando cliente mostra sinais de saída
2. **Next Best Action**: IA sugere próxima ação do CS para cada cliente
3. **Upsell triggers**: Momento certo de oferecer upgrade baseado em uso