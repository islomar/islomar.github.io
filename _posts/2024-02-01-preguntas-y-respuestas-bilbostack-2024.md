---
title: "Preguntas y respuestas de mi charla en la BilboStack 2024"
lang: es
date: 2024-01-31T16:26:27+01:00
last_modified_at: 2024-02-04T08:26:27+01:00
redirect_from:
  - /blog/talks/preguntas-y-respuestas-bilbostack-2024/
categories:
  - blog
  - talks
tags:
  - talks
  - bilbostack24
  - spanish
---

Cuando en la pasada y maravillosa [BilboStack](https://bilbostack.com/){:target="_blank"}{:rel="noopener noreferrer"} finalicé [mi charla sobre Continuous Deployment](/blog/talks/slides-and-resources-talk-bilbostack-2024) (no me cansaré de repetir que como excusa para hablar de "lo importante"), me hicieron saber que no había ninguna pregunta 😱
 En mi experiencia, cuando eso pasa, es que el nivel de turra ha sido astronómico y el mensaje no ha llegado de ninguna manera 😅

Por suerte, parece ser que la explicación era menos dramática: hubo algún problema con la aplicación que recogía las preguntas (¿faltaría algún test? 😜). La organización ha tenido el detallazo de enviármelas _a posteriori_, así que intentaré contestarlas en este post.

**Aclaración importante**: me falta muchísimo contexto en casi todas las preguntas; necesitaría entender mejor muchísimas cosas antes de dar una respuesta "razonable". Lo haré explícito en las respuestas de algunas pero lo inferiré en otras 🙏

---------------------------

1. **¿Puedes explicar cómo conseguir la ISO 27001/SOC2 trabajando en continuos delivery?**
- Resumen: realmente no 🤣 Pero puedo compartir algunas cosillas que tal vez ayude en algo...
- Algo que comentaba el otro día hablando con otra persona sobre este tema es que tendemos a dar por hecho demasiadas cosas. Lo primero que siempre debemos hacer es ENTENDER en profundidad las necesidades a satisfacer. Creo que hay mucho "teléfono escacharrao" e inferimos que se necesitan muchas cosas que en realidad son una posible solución (e.g. que haya una PR) en lugar de la necesidad de base a resolver (e.g. que más de una persona haya revisado algo).
- Dicho esto: tengo claro que el auditor que te toque puede influir muchísimo.
- A mucho más alto nivel, Clarity publicó un post al respecto: ["ISO27001 and SOC2 Type II from Greenfield to Success"](https://medium.com/clarityai-engineering/iso27001-and-soc2-type-ii-from-greenfield-to-success-24ca99decb26)
- En mi equipo hacíamos de hecho "Continuous Deployment" y en nuestro caso era suficiente con seguir los siguientes requisitos:
  * Cada commit incluía el **issue de Jira** que lo originaba: se generaba una traza inequívoca con la necesidad de la que surgía ese código.
  * Puesto que trabajábamos en pairing o ensemble por defecto, en cada commit incluíamos a todas las personas involucradas usando el **["Co-authored-by" de Git](https://docs.github.com/es/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors)**      
        - Para reducir la fricción, todos teníamos un **template del [git message](https://gist.github.com/lisawolderiksen/a7b99d94c92c6671181611be1641c733)** con el resto de compañeras del equipo, no teníamos que estar escribiéndolo conitnuamente.
        - Hasta donde sé, y simplificando mucho, una de las cosas que se requiere es **evidencia** de que una persona diferente a quien escribió el código, lo ha revisado. Esta práctica satisfacía esa necesidad.  
  * Si el cambio a realizar era "muy trivial" (lo cual siempre es abstracto, pero teníamos un documento definiéndolo), se permitía que no hubiera un revisor (e.g. cambio en documentación). En estos casos, era suficiente con incluir en el mensaje del commit cierta palabra clave (en nuestro caso concreto, `[trivial-small-change]`)
- Para la gente que trabajaba con ramas y PRs, la persona que validaba la PR debía ser diferente a la persona que la había abierto.
- Si necesitas más detalle, probablemente [Edu Ferro](https://twitter.com/eferro) pueda contarte más cosas 🙏

1. **¿Qué opinas de los code freeze? ¿Tienen sentido en determinados casos? Por ejemplo, una empresa grande con equipos distribuidos en distintas zonas horarias**
- Preguntas que me surgen:
  - ¿Hablamos de equipos distribuidos o de sistemas distribuidos? ¿O de ambas cosas?
  - Cuando hablamos de equipos distribuidos, ¿a nivel individual o de equipo? ¿Están todos los miembros de un mismo equipo en zonas horarias muy diferentes? ¿O la dispersión era a nivel de equipo? (es decir, miembros de un mismo equipo en zona horaria similar, pero cada equipo en zonas horarias muy diferentes)
- Si bien creo que todo puede tener sentido en algún contexto, en general los "code freeze" (sobre todo si ocurren con relativa frecuencia) son un mal síntoma. El mero hecho de ser una empresa grande con equipos distribuidos en distintas zonas horarias no implica que deban existir esos "code freeze". Cada equipo debería tener el ownership e2e de un "value stream" (ver los ["stream-aligned teams" de Team Topologies](https://martinfowler.com/bliki/TeamTopologies.html)).
- Aquí entra en juego y hay que tener mucho cuidado con la [ley de Conway](https://martinfowler.com/bliki/ConwaysLaw.html) y [su reverso](https://www.agileanalytics.cloud/blog/team-topologies-the-reverse-conway-manoeuvre), cómo están diseñados los equipos, los sistemas y sus responsabilidades.
- Algo que también puede ayudar es la existencia de ["Team APIs"](https://medium.com/agile-outside-the-box/team-apis-af2dbc1805e7).
- Según el nivel de solapamiento horario, se pueden poner unas horas "core" para el pairing/ensemble.
- Si hablamos de personas distribuidas: una estrategia de branching tipo ["Ship, Show, Ask"](https://martinfowler.com/articles/ship-show-ask.html) puede ser interesante.
- Si de lo que hablamos es de un sistema distribuido y no sólo equipos distribuidos (que no es lo mismo), entonces es fundamental hacer muy buen ["Contract Testing"](https://martinfowler.com/bliki/ContractTest.html): cada sistema/servicio debería poder ser testeado funcionalmente de forma "aislada" sin depender del resto de servicios. Esto es independiente de tener algún tipo de tests end-to-end adicionales (lo cual en sistemas complejos distribuidos se complica bastante).

1. **¡Gracias por la charla! ¿Cuál sería en tu opinion una buena estrategia de ramas? Actualmente al tener baby-commits y al mergear con la rama principal optamos por squash and merge, que crea un nuevo código de commit y se pierde el rastro de los antiguos commits entrando en un infierno de commits a la hora de revisar PRs. Nos suelen pedir intentar hacer un solo commit por desarrollo y luego mergeo (not fast foward) y yo consigo eso con git -ammend**
- Mi primera respuesta: "depende" 😜
- Mi segunda respuesta: la estrategia de ramas que, en general, mejor permite tener feedback rápido y un aporte de valor continuo y sostenible es "Trunk-Based Development" con una única rama por defecto (acompañado, como comentaba en la charla, de pair/ensemble programming, TDD, una pipeline segura, repetible y potente, micro-commits, etc.)
- Personalmente priorizo el flow continuo y llevar cuanto antes el commit a Producción, que un histórico "impoluto" de commits. Lo que sí es siempre importante es que los commits sean descriptivos y cuenten claramente "el porqué" ante todo ("el qué" está implícito en el commit).
- En la línea de lo que comentas, la buena gente de [Codely](https://codely.com/) grabó hace un par de años un vídeo con sus opiniones al respecto, creo que te podría interesar en caso de que no puedas trabajar con una rama única, te lo recomiendo: ["Git Merge vs Rebase vs Squash ¿Qué estrategia debemos elegir?"](https://www.youtube.com/watch?v=HlmZLXMOpEM)

1. **¿Ventajas y desventajas de tener los test en un git hook?**
- Aclaración: todo lo que se meta en Git hooks debe ser "rápido". Qué significa "rápido" depende de la sensibilidad de cada persona o equipo, pero en mi experiencia, toda ejecución que supere los 5 segundos empieza a "doler" (los "push" pueden tardar algo más porque los solemos ejecutar con menos frecuencia, pero no mucho más). En cualquier caso, y en mi opinión, es mejor tener que esperar "un poco" en el momento del commit-push que encontrarnos con demasiadas "sorpresas" más tarde (problema de "context switch"). Y por otra parte, es conveniente balancear qué se incluye en el pre-commit y qué en el pre-push (ver [ejemplos en los diagramas con ejemplos reales de la charla](./2024-01-29-slides-and-resources-talk-bilbostack-2024.md))
- _Ventajas_: tener feedback mucho más rápido si fallan los tests (no tener que esperar a que fallen en la pipeline, cuando ya hemos cambiado el foco y estamos a medias de otra cosa). Por supuesto no incluiría los tests más "lentos", pero sí los "rápidos" (en mi opinión todos los unitarios deberían serlo, así como algunos de integración - qué considero "unitario" o "integración" da para otro post). 
- _Inconvenientes_: el inconveniente surge si su ejecución es "demasiado lenta"; lo que acabará pasando es que los saltaremos o acumularemos demasiados cambios. La solución pasa por tener en los Git hooks únicamente los tests más rápidos o que no provoquen demasiada sensación de ralentización. Paralelizar todo lo posible su ejecución es importante para disminuir los tiempos.

1. **De primeras, muy interesante. Como pregunta ¿no notaste que los hooks pre-commit y pre-push podian añadir friccion y latencia en el proceso de commit, llevando al equipo a hacer commits mas grandes para evitar hacer menos commits por pasar menos procesos?**  
Muy buena pregunta, y por desgracia no es difícil que ocurra, hay que estar muy pendiente de ello. Lo he intentado contestar en la pregunta anterior ☝️🙏

1. **¿Validaciones sincronas o PR en asincrono?**
- No sé si entiendo esta pregunta, lo siento. ¿Qué quieren decir "validaciones"? ¿Hablamos de los tests? ¿De linters? ¿O de la revisión de código?
- En la línea de lo que comenté en la charla: debemos intentar tener feedback los más rápido y frecuente posible de todo. En la medida de lo posible, priorizaría las revisiones de código síncronas; y aún mejor: hacer pairing/ensemble todo lo "posible".
- También recomendaría echar un vistazo a la estrategia de branching ["Ship, Show, Ask"](https://martinfowler.com/articles/ship-show-ask.html),  puede ser interesante como avance hacia la reducción de tiempos de integración.

1. **Cuando el "circulo vicioso" que has enseñado al principio se ha hecho tan grande, ¿cómo sales de ahí?**
- Uuufffff, difícil pregunta (o mejor dicho, difícil respuesta 😅). Lo primero necesario es tener consciencia general del problema y de su naturaleza (yo diría que esto es lo más difícil). Hacerlo visible y explícito, con datos, siempre ayuda (e.g. tomar tiempos de todo lo que ocurre desde que hacemos un commit hasta que llega a Producción), ponerlo negro sobre blanco. 
- Lo siguiente importante es querer realmente invertir tiempo para resolverlo, ver claramente el beneficio que eso puede reportar (lo cual de nuevo suele ser muy difícil si no se ha experimentado antes). 
- Si se cumple todo lo anterior: ir poquito a poco. Identificar primero los "quick wins" que puedan existir (bajo coste y alto beneficio). Mejorar el testing automatizado. Ir disminuyendo todo lo posible los tiempos de nuestras ramas/PRs. Adoptar estrategias de branching que disminuya el tiempo que tardamos en integrar en la rama principal. Aumentar y mejorar la colaboración (e.g. a través del pairing). Aprender técnicas de cambios paralelos y empezar a usar "feature flags".
- Y creo que el mejor consejo: buscad y contratad a alguien con experiencia en todo lo anterior, es extramadamente difícil si no (no digo que no sea posible, pero sí muy complicado).

1. **¿Como se puede poner en valor el aporte de CI/CD y hacer perder el miedo a desarrolladorxs de desplegar pronto cosas?**  
Yo como mejor lo he visto hacer es liderando con el ejemplo (lo cual requiere experiencia haciéndolo), haciendo al mismo tiempo mucha pedagogía al respecto (sobre el valor que aporta a todes, tanto negocio como ingeniería). No creo que haya atajos ni fórmulas mágicas... 😕 Por supuesto, ese "desplegar pronto cosas" debe ir acompañado de una red de seguridad potente, si no será peor el remedio que la enfermedad y la gente, con razón, no querrá hacerlo.

1. **¿Utilizas estrategias de pairing como el ping-pong? En estos casos, ¿no sería molesto el uso de Git Hooks?**
- En el pasado sí he hecho pairing con TDD en ping-pong (diría que he hecho pairing en todas o casi todas las modalidades posibles 🤣)
- Cuando he hecho ping-pong (la persona A escribe el test, B lo pasa, refactor, B escribe el siguiente test, etc.) lo hacía compartiendo el terminal (es decir, ambas personas trabajábamos realmente en la misma máquina, usando [tmate](https://tmate.io/)). Eso implica que no hacíamos commit hasta que el test no estuviera en verde (y por tanto los Git hooks no eran un problema).
- Algo que no haría, independientemente de los Git Hooks, es subir código a la rama principal sin tests.
- Hay gente que usa [esta herramienta](https://github.com/remotemobprogramming/mob), podría cubrir según qué casos de uso (personalmente prefiero no hacer ping-pong y ya está, rotamos por pomodoro y ya es suficiente).
- Sobre pairing, este post es realmente bueno: [On Pair Programming](https://martinfowler.com/articles/on-pair-programming.html)

1. **¿Tener muchos micro commits no puede ensuciar la rama main?**
- Depende de lo que se entienda por "ensuciar". Lo que siempre es importante es tener commits con buenos mensajes, describiendo muy bien "el porqué"; y por supuesto ningún commit debe romper los tests. 
- Dicho esto, creo que es más importante dar pasitos pequeños y el feedback y flow muy continuos que una supuesta historia de commits "ideal".

1. **Generalmente lo que se pide es que la feature este completa antes de subir y no quieren ver nada hasta que no esté, ¿Sería aplicable trunk-based?**  
- Absolutamente. Para resolver el problema que describes, que efectivamente es muy habitual, existen múltiples técnicas de cambios paralelos ([incluí información al respecto](https://islomar.es/blog/talks/slides-and-resources-talk-bilbostack-2024/#parallel-changes)) y sobre todo el uso de [feature flags/toggles](https://martinfowler.com/articles/feature-toggles.html). 
- Esto está relacionado con el desacoplamiento que mencionaba durante la charla entre "Deployment" (decisión técnica) y "Release" (decisión de negocio).

1. **Para usar CD con trunk-based development, a la hora de hacer commits y pushearlos, ¿teniais algun tipo de configuracion para prevenir commit que no pasasen los tests?**  
Sí, teníamos configurados Git hooks tanto de pre-commit como de pre-push. En los [diagramas de los slides de la charla](/blog/talks/slides-and-resources-talk-bilbostack-2024) puedes ver qué incluíamos en cada uno de ellos. Por la forma en que funcionan los Git hooks, si el pre-commit no pasa (i.e. si estado de salida es distinto de cero), no se realiza el commit (idem para el pre-push).

1. **A la pregunta que ha hecho: "Es para cambiar el Mundo, porque en mayor o menos medida cuando subimos un cambio, estos cambian la vida de algunas personas (para bien o para mal) nuestros usuarios o cliebtes, porque tienen herramientas para hacer mejor su trabajo"**  
- Entiendo que esto es la respuesta a la pregunta que lancé: "¿Para qué desarrollamos software profesionalmente?". Me parece una perspectiva maravillosa, la verdad, me siento muy alineado con la idea que subyace a ella.
- En relación con el matiz que mencionaba en mi respuesta y que era lo que quería resaltar, te diría: ¿y si pudieras cambiar/mejorar el mundo de manera más óptima/eficiente **SIN** software, no lo harías? 😉

1. **¿Tendría sentido ejecutar varios procesos de CI en paralelo? Por ejemplo los unit tests, construir la build y los e2e tests a la vez**  
- Sí, pero depende de cuales. Sin duda **debemos paralelizar todo lo posible**, comenzando por los propios tests (casi todas las librerías de testing permiten la ejecución en paralelo); además, así nos forzamos a escribir tests "autocontenidos", cuya entrada o salida no dependa de otros tests ni los contamine (lo cual es por defecto lo más recomendable). Con los tests unitarios y de integración no debería haber problema. Con los tests e2e/acceptance tal vez sí (merece la pena diferenciar cuáles se puden paralelizar y hacerlo).
- En los [dos ejemplos reales que incluí](https://speakerdeck.com/islomar/valor-por-encima-de-codigo-el-poder-del-despliegue-continuo?slide=44), puedes ver qué paralelizamos y qué no, diría que casi todo con mucha consciencia (y siempre mejorable) 😊
- Si por ejemplo miramos la segunda pipeline, te puedo contar por qué no paralelizamos en concreto las tres tareas que comentas:
  - No queríamos invertir tiempo en el build de la imagen de Docker (y el posterior push a un ECR) si los tests no pasaban antes.
  - Los tests unitarios son los más rápidos, por lo que son los más bloqueantes: no queremos hacer nada más si eso falla (otro motivo por el que no paralelizarlos con según qué). Sí los podemos paralelizar con otras tareas también rápidas, como linters y otras validaciones estáticas.
  - En cuanto a los tests e2e: en nuestra taxonomía de testing, esos son tests que lanzamos contra la nueva versión del sistema ya desplegado en alguna parte (staging o production), por lo que no podríamos paralelizarlo tampoco con la build o tests unitarios.
  - Los tests que sí paralelizamos como primer paso de la pipeline son los **unitarios** (cumplen [los principios FIRST](https://github.com/tekguard/Principles-of-Unit-Testing){:target="_blank"}{:rel="noopener noreferrer"}), **integración** (en nuestro caso son tests para los adaptadores secundarios de [nuestra arquitectura hexagonal](https://herbertograca.com/2017/09/14/ports-adapters-architecture/){:target="_blank"}{:rel="noopener noreferrer"}) y tests de aceptación (que son tests "desde fuera" y los lanzamos contra el sistema que incluye las actualizaciones, levantado "en local", antes de ser deplegado).

1. **Cuando haces TDD outside-in haces primero los tests desde el punto de vista del usuario pero, ¿continuas con tests más internos?**  
- Exactamente, ésa es la idea. Similar a [Acceptance TDD](https://www.agilealliance.org/glossary/atdd/), [Specification by Example](https://gojko.net/books/specification-by-example/){:target="_blank"}{:rel="noopener noreferrer"} o [Behaviour-Driven Development (BDD)](https://dannorth.net/introducing-bdd/){:target="_blank"}{:rel="noopener noreferrer"} (existen matices de diferencias entre los tres, pero en los tres casos buscamos testear el comportamiento del sistema desde el punto de vista de su usuario externo)
- Decir que tal vez no siempre sea posible (yo no siempre lo consigo), pero sí debería ser el primer enfoque: cuando se hace así, la experiencia de desarrollo es fantástica (y por supuesto también revierte en la de usuario) 😍

1. **¿Consideras indispensable que el continous delivery llegue siempre hasta producción? ¿No sería suficiente con un entorno de Test que sea una replica de Producción para evitar riesgos?**  
- No debemos confundir "Continuous Delivery" y "Continuous Deployment". En la primera parte de mi charla intenté explicar [las diferencias](https://speakerdeck.com/islomar/valor-por-encima-de-codigo-el-poder-del-despliegue-continuo?slide=16){:target="_blank"}{:rel="noopener noreferrer"}.
- Con **"Continuous Delivery"**, efectivamente la pipeline no llega a desplegar en Producción. Puede, por ejemplo, quedarse en un enterno previo (e.g. Staging). Lo importante es que una vez nuestro código se integra en la rama principal y se ejecuta la build y tests automatizados, queda en un "estado desplegable": cuando lo deseemos, a voluntad, podríamos desplegarlo a Producción (ese despliegue debería ser sencillo y repetible).
- Con **"Continuous Deployment"**, ahí ya sí, toda la pipeline está completamente automatizada, incluido el paso de despliegue a Producción.
- En la primera pipeline de ejemplo que mencioné, teníamos Continuous Deployment pero sí se desplegaba previamente a un entorno de Staging: tras desplegar ahí, se ejecutaban automáticamente varios tests e2e y smoke (lo más crítico) y si todo funcionaba correctamente, automáticamente se desplegaba a Producción.

1. **Entendiendo que una release es un concepto de negocio y no tecnológico, ¿por qué tomar el _product delivery lead time_ es importante como métrica? ¿No es algo fuera del control de tecnología?**  
- Buena pregunta. Mi respuesta: porque es fundamental verlo como un "todo". Desde "ingeniería/tecnología" tenemos que entender que la tecnología es un medio para un fin. 
- Para mí es una de las claves de la evolución hacia "product engineering": entender que TODOS somos producto y negocio, que lo que hacemos debe responder a necesidades de usuarios.
- En realidad desde "ingenería" podemos y debemos influir mucho más de lo que creemos en el "product delivery lead time". Muy a menudo he visto cómo la visión de los _product managers_ cambia (para bien) cuando los desarrolladores ponemos sobre la mesa formas más sencillas de empezar a satisfacer la necesidad del usuario.
- Evidentemente, es necesaria la cultura adecuada en la empresa para que lo anterior ocurra y no nos encontremos con reinos de taifas y compartimentos estancos donde diferenciemos por completo "negocio" y "tecnología": debemos ir hacia entender que **todos somos PRODUCTO** y necesitamos colaborar de forma continua e intensa.
- Por último: como yo lo veo, un "product team" está compuesto de perfiles varios, todos con igual importancia. El "product manager/owner" debe ser un miembro más del equipo, con horizontalidad respecto a los demás.

1. **Al trabajar siempre en la misma rama, si se hace push al server y algo falla. Como parte de ese rollback ¿se auto generaría un commit con revert? ¿O tendríamos bloqueado la rama principal?**  
- Lo primero: hagamos en cada contexto lo que mejor que podamos y sepamos, que ya es mucho 😄
- En el [segundo ejemplo del mundo real](https://speakerdeck.com/islomar/valor-por-encima-de-codigo-el-poder-del-despliegue-continuo?slide=45){:target="_blank"}{:rel="noopener noreferrer"} que incluí en la charla, era un rollback muy rápido del despliegue, por lo que no se generaba ningún commit. Por dar más detalles técnicos, hacíamos el [rollback con helm](https://helm.sh/docs/helm/helm_rollback/){:target="_blank"}{:rel="noopener noreferrer"} (que era lo que también usábamos para el despliegue).
- Cuando eso ocurría, recibíamos un mensaje en el canal de Slack de equipo que teníamos para cuestiones importantes (e.g. cualquier fallo en la pipeline). 
- El rollback automático en Producción nos daba la tranquilidad de saber que se quedaba en un estado estable, que seguía funcionando lo anterior.
- En cuanto acabábamos el pomodoro que estaba en curso (trabajamos principalmente en _ensemble_), priorizábamos inmediatamente ver qué había fallado y lo resolvíamos. No había ningún "bloqueo" de la rama principal porque trabajábamos en _ensemble_. Pero si no fuera así, como comenté en la charla arreglar una pipeline rota debe ser **PRIORITARIO**, por lo que no es que se quede bloqueada, sino que hay que arreglarla _ipso facto_, y además todos a una en el equipo, da igual quién hizo el commit que lo rompió (creo que el cambio de mentalidad es importante, y el trabajar de forma aislada y muy individualista no ayuda).
- Trabajando en rama única con lead time de minutos, no teníamos necesidad del concepto de "hot fix": tras el rollback automático, en cuanto podíamos lo arregláblamos (pocos minutos) y comiteábamos el arreglo que fuera (con un test automático incluído para evitar que se repitiera, de ser posible) y p'arriba 😉
- Parte de la filosofía aquí es que cuando hay un incidente en Producción, lo primero y más importante es que Producción deje de fallar cuanto antes: puede ser porque volvemos a la versión anterior o porque comiteamos muy rápidamente una solución.
- A lo largo de 2 años, son muy pocas las ocasiones en las que ese rollback nos ocurrió (teníamos una red de seguridad previa bastante potente). No debemos acostumbrarnos a que esté ocurriendo cada dos por tres, sería síntoma de que tenemos que invertir en mejorar la red de seguridad previa.

1. **¡Gracias por la charla crack! Me encanta tu punto sobre la disciplina y sobre todo el cuello de botella enfocado en el conocimiento! Tengo una duda, este mundo ha ido evolucionando con términos como CI/CD y otros como DevOps, DevSecOps. ¿Qué opinas sobre esto? ¿Quién debería tener esta responsabilidad, una persona, un equipo? Me encantaría saber tu punto de vista**  
- ¡Gracias! Pues [opino de que](https://www.youtube.com/watch?v=GYtzu_G4A4M) con DevOps se ha llegado a una situación de ["inversión semántica"](https://martinfowler.com/bliki/SemanticDiffusion.html): ha acabado significando exactamente lo contrario de lo que se buscaba. Se buscaba mejorar la colaboración y derribar silos de conocimiento, bloqueos y pasos de patata caliente, pero en general ha acabado con "equipos DevOps" (en realidad un renombrado del "equipo de sistemas") que siguen manteniendo el silo, las dependencias bloqueantes, etc. _</rant>_
- [DevOps](https://martinfowler.com/bliki/DevOpsCulture.html) es una cultura, no un equipo. Lo cual no es incompatible con tener, por ejemplo, [equipo(s) de plataforma o enablers que faciliten la vida a los equipos "stream-aligned"](https://martinfowler.com/bliki/TeamTopologies.html) con diversas herramientas y servicios _self-service_. Pero los equipos, digamos "de producto externo", no deben tener dependencias bloqueantes de esos equipos. 
- Y lo mismo aplicaría a DevSecOps, todo lo posible debería estar integrado en la pipeline de despliegue/delivery, probablemente apoyándonos en servicios/herramientas de otros equipos.

1. **¿Crees que el approach trunk/CI es válido para resolución de deuda técnica o sustaining como incremento de versiones de frameworks o librerías? ¿O es algo exclusivo de delivery de producto?**  
- Totalmente, creo que TBD/CI puede aplicarse a múltiples contextos. 
- De hecho creo que la mejor manera de abordar la **[deuda técnica](https://martinfowler.com/bliki/TechnicalDebt.html){:target="_blank"}{:rel="noopener noreferrer"}** (que por cierto, tendríamos que estar seguros de que hablamos de lo mismo 😄) es poco a poco. Hacer "sprints de deuda técnica" suele ser síntoma de falta de "slack/holgura" en el equipo (entre otras cosas).
- En cuanto a la **actualización de frameworks/librerías**: aquí ya te diría que "depende". 
  - Para actualizaciones de librerías, te diría que sí (en mi equipo teníamos un [renovatebot](https://github.com/renovatebot/renovate){:target="_blank"}{:rel="noopener noreferrer"} actualizando automáticamente a diario todas las librerías y desplegando al final igualmente la pipeline). Pero de nuevo, lo que repito todo el tiempo: necesitas una red de seguridad potente, sobre todo muy buenos tests automatizados.
  - En cuanto a actualizaciones de frameworks: depende de las implicaciones del cambio. Normalmente sí, pero cuando son versiones _major_ no es improbable que el impacto sea suficientemente grande como para requerir hacerlo en una rama que viva más de 24 horas y poder cambiar y probar ahí todo tranquilamente.

1. **¿Tienes alguna sugerencia o técnica para ejecutar E2E tests en producción? ¿Tráfico sintético, mirroring de tráfico, etc.?**  
Interesante pregunta 😄 La respuesta: "depende del contexto" (sorry, not sorry). Por si te aporta, puedo contarte dos casuísticas muy diferentes que me he encontrado (entre otras muchas):
- **En [Clarity AI](https://clarity.ai/){:target="_blank"}{:rel="noopener noreferrer"}**:
  - Ver la [segunda pipeline de ejemplos de la vida real](https://speakerdeck.com/islomar/valor-por-encima-de-codigo-el-poder-del-despliegue-continuo?slide=45){:target="_blank"}{:rel="noopener noreferrer"} que compartí. 
  - Ahí teníamos varios tests e2e (los que imitan a un usuario real): algunos en [Cypress](https://www.cypress.io/){:target="_blank"}{:rel="noopener noreferrer"} (el servicio principal era una [app en Slack (con un _slashcommand_)](https://api.slack.com/interactivity/slash-commands){:target="_blank"}{:rel="noopener noreferrer"}, así que estos tests accedían realmente a Slack desde un navegador y ejecutaban varios comandos) y algunos en Python puro y duro (peticiones a algunos endpoints HTTP que también publicábamos).
  - Los servicios/aplicaciones ahí desplegadas eran todas para uso interno de trabajadoras en Clarity (300 empleados en su momento), principlamente Ingeniería.
  - Por todo lo anterior, en nuestro caso específico la escalabilidad no era un problema: no teníamos cientos ni miles ni millones de usuarios concurrentes. Así que no necesitábamos tests de carga ni de estrés, y los tests e2e que teníamos no necesitaban nada especial.
- **En [Form3](https://form3.tech/){:target="_blank"}{:rel="noopener noreferrer"}**: 
  - Aquí ya la cosa cambia: durante varios meses estuve en el (micro)equipo de escalabilidad, cuya principal responsabilidad era detectar (y a veces corregir) cuellos de botella en la escalabilidad de nuestro (no simple) sistema distribuido.
  - Decir que el producto de Form3 era (o es) un [API HTTP](https://www.api-docs.form3.tech/){:target="_blank"}{:rel="noopener noreferrer"} en fintech. Manejábamos muuuuucha pasta diaria y era bastante crítico (no moría gente, pero poca broma con la panoja 🤣)
  - Algo muy interesante es que trabajábamos mano a mano con la gente de Ventas para generar tráfico simulado conforme a la predicción "real" de nuevos usuarios (e.g. si se había firmado X contratos para cierta fecha, que implicaría N clientes/usuarios nuevos).
  - Los tests e2e de carga y de estrés los hacíamos con [k6.io](https://k6.io/){:target="_blank"}{:rel="noopener noreferrer"} (de hecho Form3 acabó sacando una [solución open-source llamada 'f1'](https://github.com/form3tech-oss/f1){:target="_blank"}{:rel="noopener noreferrer"} que lo simplificaba a partir del trabajo que hicimos en mi equipo, es muy interesante, recomiendo echarle un vistazo). Creábamos una distribución de peticiones horaria diaria similar a la que solíamos tener, con distribuciones Gaussianas, pero con los volúmenes estimados.
  - Es algo que, la verdad, no había visto hacer antes ni lo he vuelto a ver 🤯

1. **¿Cómo se puede balancear baterías de test enormes que hacen que las pipelines tarden, con la rapidez que se necesita en trunk based?**  
- Por aclararlo, en Trunk-Based Development (TBD) o CI esa "rapidez" tampoco es tanta en mi opinión: al menos mergear una vez al día en la rama principal. Yo diría que cuanta mayor frecuencia, mejor: por ejemplo, cada 2 horas máximo, mejor que cada 24 horas; y si puedes trabajar con rama única por defecto y estar haciéndolo cada pocos minutos, miel sobre hojuelas (en mi experiencia, la diferencia es abismal, pero la vida es dura y hagamos lo que podamos...).
- Esas "baterías de test enormes" que mencionas, ¿de qué hablamos exactamente? ¿Por qué es tan enorme? ¿Es un gran monolito no modularizado? ¿Es porque se tienen "demasiados" tests lentos?
- Como menciono más arriba: debemos paralelizar todo lo que podamos. La mayoría de nuestros tests (sean del tipo que sean, incluso de integración y e2e) deberían ser paralelizables (por defecto, siempre con excepciones, deberían iniciar lo que necesiten de forma autónoma y dejarlo como estaba antes).
- Con una correcta modularización, tal vez se podrían lanzar los tests que nos den suficiente confianza para el despliegue (solo disparar los afectados, tirar de "contract testing", sólo los e2e/funcionales/acceptance más críticos, etc.).
- Y por último: es recomendable tener muchos más tests rápidos que lentos.

1. **Tengo sentimientos encontrados con los hooks de prepush y precommit, ya que he visto que en ocasiones han llevado a  devs hacer commits mas grandes de lo que debian de ser por no pasar los procesos de linting, tests, etc. varias veces. Te queria preguntar tu opinión sobre eso. Si los has vivido o no, o si los has vivido, como habeis llegado a encauzar la situacion.** [Pregunta recibida por [Twitter](https://twitter.com/_ebikandi/status/1751521282494026052), gracias Eneko 🙏]  
- Lo primero: me faltaría entender por qué no pasan los procesos de linting, tests, etc. varias veces. ¿Es porque hay tests flakies o algún tipo de validación no completamente determinista? ¿O es porque los desarrolladores "cometen errores"?
- No me he encontrado la situación que planteas, pero porque hay varias cuestiones a las que siempre marco mucha prioridad con los Git hooks:
  - Tienen que ser **MUY rápidos**. Si no, dará pereza ejecutarlos o esperarás a tener muchos cambios para hacerlo.
  - Tienen que ser deterministas: no debe variar el resultado si no varía la "entrada" (tests, linters, lo que sea).
  - Normalmente hacemos TDD, así que si algún test falla nos solemos enterar antes, no después (**acortar el feedback loop**).
  - Tenemos linters y formatters configurados en el propio IDE, exactamente igual que en el Git hook. Eso nos permite tener normalmente feedback aún más rápido y apenas encontrarnos sorpresas cuando se ejecutan los Git hooks.
  Y... básicamente eso es todo lo que se me ocurre 😅 Como te digo: tendría que vivir "in situ" la situación para entender bien dónde está exactamente la fricción 😊🙏

1. **La posibilidad de hacer Continuous Deployment ¿no va muy ligado a la criticidad de los posibles errores de la aplicación? Es decir, no es lo mismo introducir un bug en, por ejemplo, una plataforma para escuchar música que en una app de transacciones económicas o que maneje datos muy sensibles.**  
- En mi opinión, no 😊 La motivación principal para "Continuous X" (Integration/Delivery/Deployment), como mencionaba en la charla (perdón por la autoreferencia) es **APRENDER rápido** (para poder adaptarnos y reorientarnos rápido y poder aportar valor rápido). Queremos tener feedback lo más rápido posible sobre el **QUÉ** (necesidades de usuario/cliente/negocio) y sobre el **CÓMO** (sistemas/tecnología/organización). Y eso, por normal general, lo queremos siempre, de hecho se me antoja que en el ejemplo que comentas (y en mi experiencia), probablemente más en la aplicación de música que en la financiera.
- Tal y como yo lo veo, el razonamiento es el inverso: es para habilitar ese aprendizaje continuo, esos _feedback loops_ rápidos, por lo que necesitamos entre otras cosas una muy buena red de seguridad que conllevará menos errores de la aplicación. Reducir los bugs no es un fin en sí mismo, es un medio para otras cuestiones (mejorar la experiencia de usuario, el aporte de valor, el aprendizaje continuo, etc.)
- En otras palabras: en la falsa dicotomía de "calidad vs. velocidad", en realidad sólo con buena calidad (interna) podremos conseguir la velocidad. Es un tema ya muy tratado e incluso "probado", por ejemplo en el [Accelerate](https://itrevolution.com/product/accelerate/). Hay muchos posts interesantes al respecto, por ejemplo [este de Adam Tornhill](https://codescene.com/blog/code-quality-debunking-the-speed-vs-vs-quality-myth-with-empirical-data) o [este otro](https://nelis.boucke.be/post/trunk-based-development/).

1. **Parece que intentamos reinventar la rueda pero siempre acabamos volviendo a los conceptos de Eliyahu Goldratt. ¿En qué casos consideras que NO deberíamos aplicar todos estos principios? O por el contrario, ¿los consideras universales para cualquier espacio de problema?**  
- Uuffff... una pregunta difícil. Resumen: no, no creo que sea algo universal para cualquier espacio de problema. Por ejemplo: si tienes un CRUD puro y duro, donde además "sabes" que no se va a evolucionar apenas (algo que casi nunca me he encontrado, pero venga, imaginemos), entonces no lo aplicaría. No hay incertidumbre (o eso creemos), no hay gran cosa que aprender. Pero más importante aún: es que en ese contexto a día de hoy **ni siquiera desarrollaría software**, ya hay muchas herramientas NoCode para resolver ese tipo de casuísticas (e.g. con baja lógica dominio de negocio).
- Si me pusiera "coach" 😜, hablaría del [framework Cynefin](https://en.wikipedia.org/wiki/Cynefin_framework) y que en el dominio "claro" está "tó el pescao vendío".
- Dicho todo esto: creo que es un contexto que, estadísticamente (al menos en mi [evidencia anecdótica experimentada y observada](https://en.wikipedia.org/wiki/Anecdotal_evidence)) es infinitesimal, no suele ser el contexto en el más frecuentemente solemos movernos y por el que nos pagan.

1. **Cuando por el contexto de las iniciativas, por ejemplo, cambios muy complejos, no se puede mergear diariamente, ¿no se puede considerar integración continua?**  
- Lo primero: necesitaría entender mucho mejor ese contexto que mencionas.
- Aquí voy a hacer "challenge": en la mayoría de los casos en los que una persona o equipo me ha indicado que su contexto era "especial" o "demasiado complejo" y por tanto no podía hacer X o Y, cuando he ido rascando, preguntando, entendiendo, he o hemos visto que los problemas de base eran otros y en realidad sí se podía hacer (o al menos empezar a andar el camino). No digo que sea tu caso, porque me falta mucha información, pero sí digo que casi siempre se puede.
- De forma muy esporádica todo vale, somos humanos y es lo que hay (y de hecho hay situaciones puntuales donde no queda otra). Pero si ésa es la situación del día a día, si realmente no podéis mergear diariamente a una rama principal para vuestro trabajo habitual, me cuesta pensar que no sea un problema de conocimiento, principios y prácticas (es decir, que no sea un problema autogenerado). Probablemente sea "complejidad accidental" y no "complejidad esencial" (ver el mítico ["No silver bullet", de Fred Brooks](http://www.cs.unc.edu/techreports/86-020.pdf)).
- En cualquier caso: si no vas a merger al menos diariamente, no creo que podamos hablar de "continuidad" (y no pasa nada, no es una cuestión de "purismo lingüístico", sino del valor de la práctica).
- Aquí recomendaría trabajar con alguien con experiencia en [técnicas de cambios paralelos](https://islomar.es/blog/talks/slides-and-resources-talk-bilbostack-2024/#parallel-changes), [feature flags](https://martinfowler.com/articles/feature-toggles.html), [contract testing](https://martinfowler.com/bliki/ContractTest.html), aprender a dar pasos mucho más pequeños, etc.

1. **¿Como sería el proceso de desplegar funcionalidades del front que dependen de cambios del back con TBD?**  
- Tirando de cliché: me alegro de que me hagas esta pregunta 🤣. De hecho hubo una persona durante el _networking_ que me planteó el mismo caso (tal vez fuera la misma).
- _Disclaimer_: es más que recomendable que todo un **_value stream_** se realice dentro de un mismo equipo. Siempre hay excepciones, pero como norma general tanto Front como Back de una funcionalidad e2e debería ser **responsabilidad del mismo equipo**.
- Por una parte, de nuevo tengo que mencionar la importancia del uso de [feature flags](https://martinfowler.com/articles/feature-toggles.html) para habilitar diversos tipos de cambios en paralelo. Por ejemplo para este caso concreto, podríamos tener un **_feature flag_** tanto en Front como en Back (por defecto único para ambos), de manera que pudiéramos desplegar de manera continua cualquiera de las dos partes sin impacto para los usuarios, mientras se va avanzando poquito a poco o esperamos "a la otra parte". La idea es ocultar al usuario aquello que aún no esté funcionando correctamente porque aún se está trabajando en ello.
- En este punto, me gustaría compartir una experiencia concreta que me parece muy relevante para este caso: el proyecto en el que trabajamos desde [Codium](https://www.codium.team/) en un cliente y del que mostré una de las [pipelines de Despliegue Continuo](https://speakerdeck.com/islomar/valor-por-encima-de-codigo-el-poder-del-despliegue-continuo?slide=44) que teníamos (en concreto la del backend)
  - Contexto **importante**: 
        - Formamos un equipo mixto de 3 personas de Codium y otras 3 del cliente (una de ellas como "Product Manager"). Hacíamos **pairing y ensemble programming por defecto**. Y aunque había una persona más especializada en Front y otra en Back, el resto rotábamos entre ambos mundos: apenas había silos ni compartimentos estancos, en el equipo más o menos casi todos hacíamos de casi todo (cada uno con sus fortalezas, claro). También éramos muy autónomos para la parte de Sistemas.
        - Había una parte de Back (en PHP, con Symphony) y otra de Front (React con TypeScript). Desde el Back publicábamos un API HTTP que el Front consumía.
  - Al turrón: usamos [OpenAPI](https://www.openapis.org/) para definir el contrato a cumplir entre Front y Back. Cuando se requería algún nuevo comportamiento (o cambio) e implicaba cambios en ambos lados, lo primero que hacíamos era juntarnos todo el equipo para escribir juntos el "contrato". En un fichero yaml, OpenAPI permite definir dicho contrato, e.g. la URI del endpoint, tipos de entrada, tipos de salida, códigos de estado HTTP devueltos, etc.
  - Una vez teníamos este contrato escrito entre todos, ya podíamos si queríamos abordar por separado el Front y el Back. Dependiendo del tipo de cambio, en ocasiones no hacía falta ni "feature flag".
  - Para asegurarnos de que ninguna de las dos partes rompía el contrato, teníamos varias validaciones en Git hooks y la pipeline (en el diagrama que compartí se puede ver):  
        - **Backend**: 
          - Usamos [schemathesis](https://schemathesis.readthedocs.io/en/stable/). Es una herramienta que automatiza el testing de APIs HTTP, generando dinámicamente casos de tests a partir del contrato de OpenAPI. Permite múltiples configuraciones según el número de tests que se desean, paralelismo, etc.
          - Básicamente lo usábamos para lanzar tests dinámicos a partir del contrato contra el API publicado por el Back.
          - Lo ejecutábamos en dos momentos diferentes:
            - En el Git hook de pre-push, contra un entorno local (automáticamente levantado con Docker)
            - Durante la pipeline se ejecutaba por ejemplo contra el entorno de Staging, una vez desplegado ahí el Back.
        - **Frontend**: 
          - Usamos [jormaechea/open-api-mocker](https://github.com/jormaechea/open-api-mocker), que es un API mocker basado en OpenAPI 3.0
          - Básicamente levantaba un servidor mock a partir del contrato que teníamos de OpenAPI, y era quien recibía las peticiones durante ciertos tipos de tests del Frontend.
        - El fichero yaml con el contrato de OpenAPI estaba tanto en el Front como en el Back: esa duplicidad no era ideal, pero sí muy "barata" en su momento. En la pipeline teníamos una validación para asegurarnos de que el contrato era exactamente el mismo en ambos lados (y por supuesto nos enterábamos inmediatamente si eso ocurría).
 - **IMPORTANTE**: la elección de estas herramientas fue realizada hace varios años, es más que probable que hoy en día existan mejores soluciones 😊  
 - Si los endpoints del Back fueran consumidos por **muchos** más consumidores (valga la rebuznancia), tal vez podríamos plantearnos soluciones más avanzadas (y también mucho más complejas, mejor esperar a necesitarlo DE VERDAD), como [Pact](https://pact.io/).

-------------------------------------------

¡¡Y esto es todo!! Con esto me quito la espinita de no haber podido dar respuesta a ninguna pregunta tras mi charla 😊 

La verdad es que me he divertido mucho respondiendo, ha sido un ejercicio interesante y ya sólo espero haberle aportado algo a alguien 🙏