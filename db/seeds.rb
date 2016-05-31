Plan.create(name: 'Básico', description: "linha 1 \n linha 2 \n linha 3", subtitle: 'Acesso Limitado', price: 0.20, status: CommonStatus::ACTIVE, kind: PlanKind::PER_EMAIL)
Plan.create(name: 'Premium', description: "linha 1 \n linha 2 \n linha 3", subtitle: 'Somente o céu é o limite!', price: 0.10, status: CommonStatus::ACTIVE, kind: PlanKind::PER_EMAIL, featured: true)
Plan.create(name: 'Plus', description: "linha 1 \n linha 2 \n linha 3", subtitle: 'Envie quanto puder!', price: 0.15, status: CommonStatus::ACTIVE, kind: PlanKind::PER_EMAIL)

Configuration.create(plan: Plan.first, from_email: 'noreply@pooliticos.com')
User.create(email: 'admin@admin.com', password: '12345678', password_confirmation: '12345678')

Group.create(configuration: Configuration.first, name: 'Grupo Padrão - TESTE', description: 'Grupo de TESTES', status: 1)

[['Paraná', 'PR'], ['Rio Grande do Sul', 'RS'], ['Santa Catarina', 'SC'], ['São Paulo', 'SP']].each do |item|
  State.create(name: item[0], initials: item[1])
end

parana = State.find_by_name('Paraná')

fb = City.create(name: 'Francisco Beltrão', state: parana)
pb = City.create(name: 'Pato Branco', state: parana)
City.create(name: 'São João', state: parana)
dv = City.create(name: 'Dois Vizinhos', state: parana)

sc = State.find_by_name('Santa Catarina')
City.create(name: 'Joinville', state: sc)
fl = City.create(name: 'Florianópolis', state: sc)

data = [
  { email: 'brunoocasali@gmail.com', state: sc, city: fl, phone: '(46) 9916-3882' },
  { email: 'ondabrazil@ondabrazil.com.br', state: parana, city: fb, phone: '(46) 3055-2463' },
  { email: 'lindones@sicoobintegrado.com.br', state: parana, city: fb, phone: '(46) 3524-2653' },
  { email: 'amsop@amsop.com.br', state: parana, city: fb, phone: '(46) 3524 2653' },
  { email: 'amsop.sudoeste@terra.com.br', state: parana, city: fb, phone: '(46) 3524 2653' },
  { email: 'contato@chacararios.com', state: parana, city: fb, phone: '(46) 9942-5552' },
  { email: 'contato@chacararios.com.br', state: parana, city: fb, phone: '(46) 9942-5552' },
  { email: 'portalpalotina@hotmail.com', state: parana, city: fb, phone: '(44) 3649-1099' },
  { email: 'tatianeronsani@gmail.com', state: parana, city: fb, phone: '(46) 9940-0066' },
  { email: 'contatos@greatcuritiba.com.br', state: parana, city: fb },
  { email: 'comercial@ksys.com.br', state: parana, city: fb, phone: '(47) 3334-2860' },
  { email: 'procuropapai1967@gmail.com', state: parana, city: fb },
  { email: 'atendimento@bioexame.com.br', state: parana, city: fb, phone: '(46) 3524-5115' },
  { email: 'annalisalise@hotmail.com', state: parana, city: fb, phone: '(46) 3055-7207' },
  { email: 'romeuawerlang@hotmail.com', state: parana, city: fb },
  { email: 'imobiliariamaua@outlook.com', state: parana, city: fb },
  { email: 'roseli_bol@hotmail.com', state: parana, city: pb, phone: '(46) 9937-4687' },
  { email: 'claudecir@polazzoimoveis.com.br', state: parana, city: pb, phone: '(46) 9937-4687' },
  { email: 'awadaconstrutora@hotmail.com', state: parana, city: pb, phone: '(46) 3224-6325' },
  { email: 'geovana@contabilizepr.com.br', state: parana, city: pb },
  { email: 'zeno@contabilizepr.com.br', state: parana, city: pb },
  { email: 'anderson.michelin@hotmail.com', state: parana, city: pb },
  { email: 'dakostaimoveis@gmail.com', state: parana, city: pb, phone: '(46) 8412-4540' },
  { email: 'comercial@radiopatobranco.com.br', state: parana, city: pb, phone: '(46) 3225-4000' },
  { email: 'ouvinte@radiopatobranco.com.br', state: parana, city: pb, phone: '(46) 3225-4000' },
  { email: 'sindimetalpb@terra.com.br', state: parana, city: pb, phone: '(46) 3225-1222' },
  { email: 'peosexat@wln.com.br', state: parana, city: dv, phone: '(46) 3536-1348' },
  { email: 'balancasdv@hotmail.com', state: parana, city: dv, phone: '(41) 3356-8420' }
]

data.each { |lead| Lead.create(lead.merge(status: CommonStatus::ACTIVE, country: 'BR')) unless Lead.exists?(email: lead[:email]) }
