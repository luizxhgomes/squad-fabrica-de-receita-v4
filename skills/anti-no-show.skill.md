---
name: anti-no-show
description: |
  Régua anti-no-show de 7 pontos com scripts prontos para a trava
  T4 Compromisso (apelido No-Show). Configura a sequência de toques do
  agendamento (T=0) até o protocolo de recuperação (T+5min), com
  personalização por segmento e canal. Objetivo: elevar o show-rate
  para 70% ou mais e manter o no-show abaixo de 15%.
inputs:
  - agenda: "reuniões agendadas (lead, data, hora, origem do lead)"
  - show_rate_atual: "percentual atual de comparecimento às reuniões"
  - canal: "canal principal de contato (WhatsApp, e-mail, telefone)"
outputs:
  - regua_configurada: "7 pontos de contato com scripts prontos por canal"
  - show_rate_alvo: "meta do ciclo (referência canônica de 70% ou mais)"
  - protocolo_recuperacao: "sequência T+5min para no-shows"
wraps:
  - data/8-travas.md
applies_to_qg: QG-003
business_rule: BR-002
agent_origin: maquina-comercial
---

# Skill: Anti-No-Show

## Purpose

No-show é a trava T4 (Compromisso, apelido No-Show): o lead qualificado agenda mas não aparece e a agenda comercial vira loteria. Taxa saudável: abaixo de 15%. Acima disso, cada ponto percentual representa oportunidades perdidas com custo já incorrido (SDR, mídia, tempo). Esta skill configura a régua completa de 7 pontos com scripts prontos, do agendamento à recuperação do no-show.

## Procedure (7 pontos de contato)

### Ponto 1, T=0: Confirmação Imediata (no ato do agendamento)
**Canal:** WhatsApp ou e-mail

```
"[Nome], nossa reunião está confirmada para [data] às [hora].

Vou te enviar o link: [link da reunião]

Para aproveitarmos bem os [X] minutos, me conta rapidinho:
→ Qual o maior desafio comercial que você enfrenta hoje?

Até lá! [Assinatura]"
```

**Por que funciona:** Ancora o compromisso imediatamente + coleta contexto para personalizar a reunião.

### Ponto 2, T-48h: Lembrete de Valor (2 dias antes)
**Canal:** WhatsApp

```
"[Nome], nossa conversa é amanhã às [hora].

Antes de nos falarmos, separei [case de empresa similar] que aumentou [resultado] em [prazo].

Vale dar uma olhada → [link ou PDF]

Nos vemos amanhã! 🎯"
```

**Por que funciona:** Entrega valor antes da reunião, aumenta o investimento psicológico do lead.

### Ponto 3, T-24h: Confirmação Direta (1 dia antes)
**Canal:** WhatsApp

```
"[Nome], confirmando nossa reunião amanhã às [hora].

Você ainda consegue? Responde aqui com SIM ou me avisa se precisar remarcar, sem problema nenhum.

[Assinatura]"
```

**Por que funciona:** Confirmação direta reduz no-show. O "sem problema" remove fricção para remarcar (melhor que simplesmente não aparecer).

### Ponto 4, T-2h: Lembrete Final (2 horas antes)
**Canal:** WhatsApp

```
"[Nome], em 2 horas nos vemos! [hora], [link]

Preparei uma análise rápida sobre [segmento/dor mencionada].

Te vejo em breve!"
```

**Por que funciona:** Lembrete funcional com antecipação de valor.

### Ponto 5, T-30min: Ping Final (30 min antes)
**Canal:** WhatsApp (apenas se não confirmou em T-24h)

```
"[Nome], daqui a pouco! Às [hora], [link]"
```

### Ponto 6, T-5min: Entrada na Sala
**Canal:** WhatsApp

```
"[Nome], estou na sala te esperando → [link]

Até daqui a pouco!"
```

### Ponto 7, T+5min: Protocolo de No-Show (se não entrou)
**Canal:** WhatsApp → Ligação → E-mail (nessa ordem)

```
WhatsApp: "[Nome], tentei te pegar aqui na sala. Aconteceu alguma coisa?
Me avisa quando puder remarcar, guardo um horário para você."

Ligação (5 min depois): Tente ligar uma vez.

E-mail (1h depois):
Assunto: Ficou faltando você, [Nome]
"Ficamos te esperando hoje às [hora]. Entendo que imprevistos acontecem.

Tenho [data1] às [hora1] ou [data2] às [hora2] disponíveis.
Qual funciona para você?"
```

## Métricas de Controle

| Métrica | Benchmark saudável | Alerta |
|---------|-------------------|--------|
| No-show rate | < 15% | > 25% |
| Taxa de remarcação | > 60% dos no-shows | < 30% |
| Confirmação em T-24h | > 80% | < 50% |

## Personalização por Segmento

- **B2B (ticket alto):** usar T=0, T-48h, T-24h, T-5min (não exagerar)
- **B2C (ticket médio):** usar T=0, T-24h, T+5min (mais leve)
- **Inbound quente:** reduzir pontos de contato (já está engajado)
- **Outbound frio:** usar todos os 7 pontos (mais resistência)

## Output Schema

```yaml
regua_configurada:
  segmento: b2b_ticket_alto | b2c_ticket_medio | inbound_quente | outbound_frio
  pontos_ativos: [T0, T-48h, T-24h, T-2h, T-30min, T-5min, T+5min]
  canal_principal: whatsapp
  scripts_personalizados: true
show_rate_alvo: ">= 70%"
protocolo_recuperacao:
  sequencia: [whatsapp, ligacao, email]
  janela: "T+5min até T+1h"
metricas_monitoradas:
  no_show_rate: "< 15%"
  taxa_remarcacao: "> 60% dos no-shows"
  confirmacao_t24h: "> 80%"
```

## Verdict Logic

- CONFIGURADA: os 7 pontos com canal e script definidos + segmentação aplicada + show-rate alvo registrado
- AJUSTAR: régua ativa mas no-show acima de 25% após 2 semanas; revisar qualificação (a causa pode estar na T5 Qualificação, não na régua)
- ESCALAR: show-rate abaixo de 50% com régua completa ativa; reabrir o diagnóstico da trava governante antes de insistir (BR-002: 1 trava por ciclo)

## Usage

```
@maquina-comercial use skill anti-no-show {cliente}
```

Aplicar quando a trava governante confirmada do ciclo é a T4 Compromisso.

## Reference

- Trava T4 Compromisso (apelido No-Show), thresholds e métricas de saída: `data/8-travas.md`
- Artefato de solução canônico: Kit Anti-No-Show
- Métricas de saída: show-rate (alvo de 70% ou mais), taxa de reagendamento recuperado, tempo médio agendamento-reunião
- BR-002 (1 trava por ciclo, blocking): `squad.yaml` business_rules
- Handoff: no-show resolvido → próxima trava via skill `diagnostico-8-travas`
