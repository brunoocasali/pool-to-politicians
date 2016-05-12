Plan.create(name: 'Básico', description: 'Descrição do Plano 1', price: 0.20, status: 1, kind: 1)
Plan.create(name: 'Plus', description: 'Descrição do Plano 2', price: 0.15, status: 1, kind: 1)
Plan.create(name: 'Premium', description: 'Descrição do Plano 3', price: 0.10, status: 1, kind: 1)

Configuration.create(plan: Plan.first, from_email: 'noreply@pooliticos.com')

Group.create(configuration: Configuration.first, name: 'Grupo Padrão - TESTE', description: 'Grupo de TESTES', status: 1)
