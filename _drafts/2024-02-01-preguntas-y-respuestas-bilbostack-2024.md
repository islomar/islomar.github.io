---
title: "Preguntas y respuestas de mi charla en la BilboStack 2024"
date: 2024-02-01T13:26:27+01:00
last_modified_at: 2024-01-29T13:26:27+01:00
toc: true
toc_label: "Table of Contents"
toc_icon: "chalkboard-teacher"
categories:
  - blog
  - talks
  - bilbostack24
  - spanish
---

Cuando en la pasada y maravillosa [BilboStack](https://bilbostack.com/){:target="_blank"}{:rel="noopener noreferrer"} finalicé [mi charla sobre Continuous Deployment](./2024-01-29-slides-and-resources-talk-bilbostack-2024.md) (no me cansaré de repetir que como excusa para hablar de "lo importante"), me hicieron saber que no había ninguna pregunta 😱
 En mi experiencia, cuando eso pasa, es que el nivel de turra ha sido astronómico y el mensaje no ha llegado de ninguna manera 😅

Por suerte, parece ser que la explicación era menos dramática: hubo algún problema con la aplicación que recogía las preguntas (¿faltaría algún test? 😜). La organización tuvo el detallazo de enviármelas _a posteriori_, así que intentaré contestarlas en este post.

**Aclaración importante**: me falta muchísimo contexto en casi todas las preguntas; necesitaría entender mejor muchísimas cosas antes de dar una respuesta "razonable". Lo haré explícito en las respuestas de algunas pero lo inferiré en otras 🙏


1. **¿Puedes explicar cómo conseguir la ISO 27001/SOC2 trabajando en continuos delivery?**
- Resumen: realmente no 🤣 Pero puedo compartir algunas cosillas que tal vez ayude en algo...
- Algo que comentaba el otro día hablando con otra persona sobre este tema es que tendemos a dar por hecho demasiadas cosas. Lo primero que siempre debemos hacer es ENTENDER en profundidad las necesidades a satisfacer. Creo que hay mucho "teléfono escacharrao" e inferimos que se necesitan muchas cosas que en realidad son una posible solución (e.g. que haya una PR) en lugar de la necesidad de base a resolver (e.g. que más de una persona haya revisado algo).
- Dicho esto: tengo claro que el auditor que te toque puede influir muchísimo.
- A mucho más alto nivel, Clarity publicó un post al respecto: ["ISO27001 and SOC2 Type II from Greenfield to Success"](https://medium.com/clarityai-engineering/iso27001-and-soc2-type-ii-from-greenfield-to-success-24ca99decb26)
- En mi equipo hacíamos de hecho "Continuous Deployment" y en nuestro caso era suficiente con seguir los siguientes requisitos:
  1. Cada commit incluía el **issue de Jira** que lo originaba: se generaba una traza inequívoca con la necesidad de la que surgía ese código.
  2. Puesto que trabajábamos en pairing o ensemble por defecto, en cada commit incluíamos a todas las personas involucradas usando el **["Co-authored-by" de Git](https://docs.github.com/es/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors)**
    - Para reducir la fricción, todos teníamos un **template del [git message](https://gist.github.com/lisawolderiksen/a7b99d94c92c6671181611be1641c733)** con el resto de compañeras del equipo, no teníamos que estar escribiéndolo conitnuamente.
    - Hasta donde sé, y simplificando mucho, una de las cosas que se requieren es **evidencia** de que una persona diferente a quien escribió el código, lo ha revisado. Esta práctica satisfacía esa necesidad.
  3. Si el cambio a realizar era "muy trivial" (lo cual siempre es abstracto, pero teníamos un documento definiéndolo), se permitía que no hubiera un revisor (e.g. cambio en documentación). En estos casos, era suficiente con incluir en el mensaje del commit cierta palabra clave (en nuestro caso concreto, `[trivial-small-change]`)
- Para la gente que trabajaba con ramas y PRs, la persona que validaba la PR debía ser diferente a la persona que la había abierto.
- Si necesitas más detalle, probablemente [Edu Ferro](https://twitter.com/eferro) pueda contarte más cosas 🙏

1. **¿Qué opinas de los code freeze? Tienen sentido en determinados casos? Por ejemplo, una empresa grande con equipos distribuidos en distintas zonas horarias**
- Preguntas que me surgen:
  - ¿Hablamos de equipos distribuidos o de sistemas distribuidos? ¿O de ambas cosas?
  - Cuando hablamos de equipos distribuidos, ¿a nivel individual o de equipo? ¿Están todos los miembros de un mismo equipo en zonas horarias muy diferentes? ¿O la dispersión era a nivel de equipo? (es decir, miembros de un mismo equipo en zona horaria similar, pero cada equipo en zonas horarias muy diferentes)
- Si bien creo que todo puede tener sentido en algún contexto, en general los "code freeze" (sobre todo si ocurren con relativa frecuencia) son un mal síntoma. El mero hecho de ser una empresa grande con equipos distribuidos en distintas zonas horarias no implica que deban existir esos "code freeze". Cada equipo debería tener el ownership e2e de un "value stream" (ver los ["stream-aligned teams" de Team Topologies](https://martinfowler.com/bliki/TeamTopologies.html)).
- Aquí entra en juego y hay que tener mucho cuidado con la [ley de Conway](https://martinfowler.com/bliki/ConwaysLaw.html) y [su reverso](https://www.agileanalytics.cloud/blog/team-topologies-the-reverse-conway-manoeuvre), cómo están diseñados los equipos, los sistemas y sus responsabilidades.
- Algo que también puede ayudar es la existencia de ["Team APIs"](https://medium.com/agile-outside-the-box/team-apis-af2dbc1805e7).
- Según el nivel de solapamiento horario, se pueden poner unas horas "core" para el pairing/ensemble.
- Si hablamos de personas distribuidas: una estrategia de branching tipo ["Ship, Show, Ask"](https://martinfowler.com/articles/ship-show-ask.html) puede ser interesante.
- Si de lo que hablamos es de un sistema distribuido y no sólo equipos distribuidos (que no es lo mismo), entonces es fundamental hacer muy buen ["Contract Testing"](https://martinfowler.com/bliki/ContractTest.html): cada sistema/servicio debería poder ser testeado funcionalmente de forma "aislada" sin depender del resto de servicios. Esto es independiente de tener algún tipo de tests end-to-end adicionales (lo cual en sistemas complejos distribuidos se complica bastante).

1. **Gracias por la charla! Cual sería en tu opinion una buena estrategia de ramas? Actualmente al tener baby-commits y al mergear con la rama principal optamos por squash and merge, que crea un nuevo código de commit y se pierde el rastro de los antiguos commits entrando en un infierno de commits a la hora de revisar PRs. Nos suelen pedir intentar hacer un solo commit por desarrollo y luego mergeo (not fast foward) y yo consigo eso con git -ammend**
- Mi primera respuesta: "depende" 😜
- Mi segunda respuesta: la estrategia de ramas que, en general, mejor permite tener feedback rápido y un aporte de valor continuo y sostenible es "Trunk-Based Development" con una única rama por defecto (acompañado, como comentaba en la charla, de pair/ensemble programming, TDD, una pipeline segura, repetible y potente, micro-commits, etc.)
- Personalmente priorizo el flow continuo y llevar cuanto antes el commit a Producción, que un histórico "impoluto" de commits. Lo que sí es siempre importante es que los commits sean descriptivos y cuenten claramente "el porqué" ante todo (el qué está implícito en el commit).
- En la línea de lo que comentas, la buena gente de [Codely](https://codely.com/) grabó hace un par de años un vídeo con sus opiniones al respecto, creo que te podría interesar en caso de que no puedas trabajar con una rama única, te lo recomiendo: ["Git Merge vs Rebase vs Squash ¿Qué estrategia debemos elegir?"](https://www.youtube.com/watch?v=HlmZLXMOpEM)

1. **Ventajas y desventajas de tener los test en un git hook?**
- Aclaración: todo lo que se meta en Git hooks debe ser "rápido". Qué significa "rápido" depende de la sensibilidad de cada persona o equipo, pero en mi experiencia, toda ejecución que supere los 5 segundos empieza a "doler" (los "push" pueden tardar algo más porque los solemos ejecutar con menos frecuencia, pero no mucho más). En cualquier caso, y en mi opinión, es mejor tener que esperar "un poco" en el momento del commit-push que encontrarnos con demasiadas "sorpresas" más tarde (problema de "context switch"). Y por otra parte, es conveniente balancear qué se incluye en el pre-commit y qué en el pre-push (ver [ejemplos en los diagramas con ejemplos reales de la charla](./2024-01-29-slides-and-resources-talk-bilbostack-2024.md))
- _Ventajas_: tener feedback mucho más rápido si fallan los tests (no tener que esperar a que fallen en la pipeline, cuando ya hemos cambiado el foco y estamos a medias de otra cosa). Por supuesto no incluiría los tests más "lentos", pero sí los "rápidos" (en mi opinión todos los unitarios deberían serlo, así como algunos de integración - qué considero "unitario" o "integración" da para otro post). 
- _Inconvenientes_: el inconveniente surge si su ejecución es "demasiado lenta"; lo que acabará pasando es que los saltaremos o acumularemos demasiados cambios. La solución pasa por tener en los Git hooks únicamente los tests más rápidos o que no provoquen demasiada sensación de ralentización. Paralelizar todo lo posible su ejecución es importante para disminuir los tiempos.

1. **Validaciones sincronas o PR en asincrono?**
- No sé si entiendo esta pregunta, lo siento. ¿Qué quieren decir "validaciones"? ¿Hablamos de los tests? ¿De linters? ¿O de la revisión de código?
- En la línea de lo que comenté en la charla: debemos intentar tener feedback los más rápido y frecuente posible de todo. En la medida de lo posible, priorizaría las revisiones de código síncronas; y aún mejor: hacer pairing/ensemble todo lo "posible".
- También recomendaría echar un vistazo a la estrategia de branching ["Ship, Show, Ask"](https://martinfowler.com/articles/ship-show-ask.html),  puede ser interesante como avance hacia la reducción de tiempos de integración.

1. **Cuando el "circulo vicioso" que has enseñado al principio se ha hecho tan grande, cómo sales de ahí?**
- Uuufffff, difícil pregunta (o mejor dicho, difícil respuesta 😅). Lo primero necesario es tener consciencia general del problema y de su naturaleza (yo diría que esto es lo más difícil). Hacerlo visible y explícito, con datos, siempre ayuda (e.g. tomar tiempos de todo lo que ocurre desde que hacemos un commit hasta que llega a Producción), ponerlo negro sobre blanco. 
- Lo siguiente importante es querer realmente invertir tiempo para resolverlo, ver claramente el beneficio que eso puede reportar (lo cual de nuevo suele ser muy difícil si no se ha experimentado antes). 
- Si se cumple todo lo anterior: ir poquito a poco. Identificar primero los "quick wins" que puedan existir (bajo coste y alto beneficio). Mejorar el testing automatizado. Ir disminuyendo todo lo posible los tiempos de nuestras ramas/PRs. Adoptar estrategias de branching que disminuya el tiempo que tardamos en integrar en la rama principal. Aumentar y mejorar la colaboración (e.g. a través del pairing). Aprender técnicas de cambios paralelos y empezar a usar "feature flags".
- Y creo que el mejor consejo: buscad y contratad a alguien con experiencia en todo lo anterior, es extramadamente difícil si no (no digo que no sea posible, pero sí muy complicado).

1. **Como se puede poner en valor el aporte de CI/CD y hacer perder el miedo a desarrolladorxs de desplegar pronto cosas?**
Yo como mejor lo he visto hacer es liderando con el ejemplo (lo cual requiere experiencia haciéndolo), haciendo al mismo tiempo mucha pedagogía al respecto (sobre el valor que aporta a todes, tanto negocio como ingeniería). No creo que haya atajos ni fórmulas mágicas... 😕 Por supuesto, ese "desplegar pronto cosas" debe ir acompañado de una red de seguridad potente, si no será peor el remedio que la enfermedad y la gente, con razón, no querrá hacerlo.

1. **Para usar CD con trunk-based development, a la hora de hacer commits y pushearlos, teniais algun tipo de configuracion para prevenir commit que no pasasen los tests?**
[Pendiente de responder]

1. **¿Utilizas estrategias de paring como el ping-pong? En estos casos, ¿no sería molesto el uso de Git Hooks?**
[Pendiente de responder]

1. **Gracias por la charla crack ! Me encanta tu punto sobre la disciplina y sobre todo el cuello de botella enfocado en el conocimiento ! . Tengo una duda , este mundo ha ido evolucionando con términos como CI\CD y otros como DevOps , DevSecOps . Que opinas sobre esto ? Quien debería tener esta responsabilidad , una persona , un equipo ? Me encantaría saber tu punto de vista**
[Pendiente de responder]

1. **Crees que el approach trunk/CI es válido para resolución de deuda técnica o sustaining como incremento de versiones de frameworks o librerías? O es algo exclusivo de delivery de producto?**
[Pendiente de responder]

1. **Al trabajar siempre en la misma rama, si se hace push al server y algo falla. Como parte de ese rollback se auto generaría un commit con revert? O tendríamos bloqueado la rama principal?**
[Pendiente de responder]

1. **¿Como sería el proceso de desplegar funcionalidades del front que dependen de cambios del back con TBD?**
[Pendiente de responder]

1. **¿Tendría sentido ejecutar varios procesos de CI en paralelo? Por ejemplo los unit tests, construir la build y los e2e tests a la vez.**
[Pendiente de responder]

1. **¿Tienes alguna sugerencia o técnica para ejecutar E2E tests en producción? ¿Tráfico sintético, mirroring de tráfico, etc. ?**
[Pendiente de responder]

**Cuando haces TDD outside-in haces primero los tests desde el punto de vista del usuario pero, continuas con tests más internos?**
[Pendiente de responder]

1. **De primeras, muy interesante. Como pregunta ¿no notaste que los hooks pre-commit y pre-push podian añadir friccion y latencia en el proceso de commit, llevando al equipo a hacer commits mas grandes para evitar hacer menos commits por pasar menos procesos ?**
[Pendiente de responder]

1. **Tener muchos micro commits no puede ensuciar la rama main?**
[Pendiente de responder]

1. **Generalmente lo que se pide es que la feature este completa antes de subir y no quieren ver nada hasta que no esté, ¿ Sería aplicable trunk-based ?**
[Pendiente de responder]

1. **¿Cómo se puede balancear baterías de test enormes que hacen que las pipelines tarden, con la rapidez que se necesita en trunk based?**
[Pendiente de responder]

1. **Parece que intentamos reinventar la rueda pero siempre acabamos volviendo a los conceptos de Eliyahu Goldratt. ¿En qué casos consideras que NO deberíamos aplicar todos estos principios? O por el contrario, ¿los consideras universales para cualquier espacio de problema?**
[Pendiente de responder]

1. **La posibilidad de hacer Continuous Deployment ¿no va muy ligado a la criticidad de los posibles errores de la aplicación? Es decir, no es lo mismo introducir un bug en, por ejemplo, una plataforma para escuchar música que en una app de transacciones económicas o que maneje datos muy sensibles.**
[Pendiente de responder]

1. **¿Consideras indispensable que el continous delivery llegue siempre hasta producción? ¿No sería suficiente con un entorno de Test que sea una replica de Producción para evitar riesgos?**
[Pendiente de responder]

1. **A la pregunta que ha hecho "Es para cambiar el Mundo, porque en mayor o menos medida cuando subimos un cambio, estos cambian la vida de algunas personas (para bien o para mal) nuestros usuarios o cliebtes, porque tienen herramientas para hacer mejor su trabajo"**
[Pendiente de responder]

1. **Entendiendo que una release es un concepto de negocio y no tecnológico, porque tomar el product delivery lead time es importante como métrica? No es algo fuera del control de tecnología?**
[Pendiente de responder]

1. **Cuando por el contexto de las iniciativas, por ejemplo, cambios muy complejos, no se puede mergear diariamente, no se puede considerar integración continua?**
[Pendiente de responder]
