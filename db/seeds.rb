Plan.create(name: 'Básico', description: "linha 1 \n linha 2 \n linha 3", subtitle: 'Acesso Limitado', price: 0.20, status: CommonStatus::ACTIVE, kind: PlanKind::PER_EMAIL)
Plan.create(name: 'Premium', description: "linha 1 \n linha 2 \n linha 3", subtitle: 'Somente o céu é o limite!', price: 0.10, status: CommonStatus::ACTIVE, kind: PlanKind::PER_EMAIL, featured: true)
Plan.create(name: 'Plus', description: "linha 1 \n linha 2 \n linha 3", subtitle: 'Envie quanto puder!', price: 0.15, status: CommonStatus::ACTIVE, kind: PlanKind::PER_EMAIL)

Configuration.create(plan: Plan.first, from_email: 'noreply@pooliticos.com')

Group.create(configuration: Configuration.first, name: 'Grupo Padrão - TESTE', description: 'Grupo de TESTES', status: 1)

[['Paraná', 'PR'], ['Rio Grande do Sul', 'RS'], ['Santa Catarina', 'SC'], ['São Paulo', 'SP']].each do |item|
  State.create(name: item[0], initials: item[1])
end

parana = State.find_by_name('Paraná')

City.create(name: 'Francisco Beltrão', state: parana)
City.create(name: 'Pato Branco', state: parana)
City.create(name: 'São João', state: parana)
City.create(name: 'Dois Vizinhos', state: parana)

sc = State.find_by_name('Santa Catarina')
City.create(name: 'Joinville', state: sc)
City.create(name: 'Florianópolis', state: sc)
