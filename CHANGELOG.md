# Changelog

Todas as mudanças relevantes deste projeto são documentadas aqui.
O formato segue [Keep a Changelog](https://keepachangelog.com/pt-BR/) e o versionamento é semântico.

## [1.0.0] - 2026-07-02

### Primeira versão pública

Squad de orquestração de agentes de IA para Claude Code, focado em estratégia de receita com
Teoria das Restrições e hierarquia chief-first.

- 27 agentes especializados organizados em 6 tiers e uma camada meta de governança, com hierarquia
  de comando Goldratt (Master Advisor), Cientista de Marketing (Chief) e sub-orquestrador operacional.
- 22 tasks executáveis, 10 workflows em pipeline (incluindo jornadas de diagnóstico completo e
  onboarding de cliente), 10 skills operacionais e 8 bases de conhecimento.
- Metodologia Fábrica de Receita completa: 8 Travas, 4 Pilares, framework STEP, ciclos de 90 dias
  e Teoria das Restrições aplicada a receita.
- 4 Quality Gates canônicos, 7 business rules e 12 handoffs entre squads.
- Design system próprio, protocolo de orquestração Prioridade 0 (chief-first) e regras de estilo
  verificadas por CI.
- Instalação em 2 modos: uso direto ao clonar (Modo A) e instalação em outro projeto via `install.sh`
  (Modo B).
