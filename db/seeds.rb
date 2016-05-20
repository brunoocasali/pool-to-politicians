Plan.create(name: 'Básico', description: "linha 1 \n linha 2 \n linha 3", subtitle: 'Acesso Limitado', price: 0.20, status: CommonStatus::ACTIVE, kind: PlanKind::PER_EMAIL)
Plan.create(name: 'Premium', description: "linha 1 \n linha 2 \n linha 3", subtitle: 'Somente o céu é o limite!', price: 0.10, status: CommonStatus::ACTIVE, kind: PlanKind::PER_EMAIL, featured: true)
Plan.create(name: 'Plus', description: "linha 1 \n linha 2 \n linha 3", subtitle: 'Envie quanto puder!', price: 0.15, status: CommonStatus::ACTIVE, kind: PlanKind::PER_EMAIL)

Configuration.create(plan: Plan.first, from_email: 'noreply@pooliticos.com')

Group.create(configuration: Configuration.first, name: 'Grupo Padrão - TESTE', description: 'Grupo de TESTES', status: 1)
