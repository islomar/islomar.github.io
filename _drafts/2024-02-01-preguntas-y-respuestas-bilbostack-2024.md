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
  - bilbostack-2024
  - spanish
---

Cuando en la pasada y maravillosa BilboStack finalicé mi charla


**¿Puedes explicar cómo conseguir la ISO 27001/SOC2 trabajando en continuos delivery?**
TBD

**¿Qué opinas de los code freeze? Tienen sentido en determinados casos? Por ejemplo, una empresa grande con equipos distribuidos en distintas zonas horarias**
TBD

**Gracias por la charla! Cual sería en tu opinion una buena estrategia de ramas? Actualmente al tener baby-commits y al mergear con la rama principal optamos por squash and merge, que crea un nuevo código de commit y se pierde el rastro de los antiguos commits entrando en un infierno de commits a la hora de revisar PRs. Nos suelen pedir intentar hacer un solo commit por desarrollo y luego mergeo (not fast foward) y yo consigo eso con git -ammend**
TBD

**Para usar CD con trunk-based development, a la hora de hacer commits y pushearlos, teniais algun tipo de configuracion para prevenir commit que no pasasen los tests?**
TBD

**¿Utilizas estrategias de paring como el ping-pong? En estos casos, ¿no sería molesto el uso de Git Hooks?**
TBD

**Gracias por la charla crack ! Me encanta tu punto sobre la disciplina y sobre todo el cuello de botella enfocado en el conocimiento ! . Tengo una duda , este mundo ha ido evolucionando con términos como CI\CD y otros como DevOps , DevSecOps . Que opinas sobre esto ? Quien debería tener esta responsabilidad , una persona , un equipo ? Me encantaría saber tu punto de vista**
TBD

**Crees que el approach trunk/CI es válido para resolución de deuda técnica o sustaining como incremento de versiones de frameworks o librerías? O es algo exclusivo de delivery de producto?**
TBD

**Al trabajar siempre en la misma rama, si se hace push al server y algo falla. Como parte de ese rollback se auto generaría un commit con revert? O tendríamos bloqueado la rama principal?**
TBD

**¿Como sería el proceso de desplegar funcionalidades del front que dependen de cambios del back con TBD?**
TBD

**¿Tendría sentido ejecutar varios procesos de CI en paralelo? Por ejemplo los unit tests, construir la build y los e2e tests a la vez.**
TBD

**¿Tienes alguna sugerencia o técnica para ejecutar E2E tests en producción? ¿Tráfico sintético, mirroring de tráfico, etc. ?**
TBD

**Cuando haces TDD outside-in haces primero los tests desde el punto de vista del usuario pero, continuas con tests más internos?**
TBD

**De primeras, muy interesante. Como pregunta ¿no notaste que los hooks pre-commit y pre-push podian añadir friccion y latencia en el proceso de commit, llevando al equipo a hacer commits mas grandes para evitar hacer menos commits por pasar menos procesos ?**
TBD

**Ventajas y desventajas de tener los test en un git hook?**
TBD

**Tener muchos micro commits no puede ensuciar la rama main?**
TBD

**Generalmente lo que se pide es que la feature este completa antes de subir y no quieren ver nada hasta que no esté, ¿ Sería aplicable trunk-based ?**
TBD

**¿Cómo se puede balancear baterías de test enormes que hacen que las pipelines tarden, con la rapidez que se necesita en trunk based?**
TBD

**Parece que intentamos reinventar la rueda pero siempre acabamos volviendo a los conceptos de Eliyahu Goldratt. ¿En qué casos consideras que NO deberíamos aplicar todos estos principios? O por el contrario, ¿los consideras universales para cualquier espacio de problema?**
TBD

**La posibilidad de hacer Continuous Deployment ¿no va muy ligado a la criticidad de los posibles errores de la aplicación? Es decir, no es lo mismo introducir un bug en, por ejemplo, una plataforma para escuchar música que en una app de transacciones económicas o que maneje datos muy sensibles.**
TBD

**¿Consideras indispensable que el continous delivery llegue siempre hasta producción? ¿No sería suficiente con un entorno de Test que sea una replica de Producción para evitar riesgos?**
TBD

**Validaciones sincronas o PR en asincrono?**
TBD

**Cuando el "circulo vicioso" que has enseñado al principio se ha hecho tan grande, cómo sales de ahí?**
TBD

**Como se puede poner en valor el aporte de CI/CD y hacer perder el miedo a desarrolladorxs de desplegar pronto cosas?**
TBD

**A la pregunta que ha hecho "Es para cambiar el Mundo, porque en mayor o menos medida cuando subimos un cambio, estos cambian la vida de algunas personas (para bien o para mal) nuestros usuarios o cliebtes, porque tienen herramientas para hacer mejor su trabajo"**
TBD

**Entendiendo que una release es un concepto de negocio y no tecnológico, porque tomar el product delivery lead time es importante como métrica? No es algo fuera del control de tecnología?**
TBD

**Cuando por el contexto de las iniciativas, por ejemplo, cambios muy complejos, no se puede mergear diariamente, no se puede considerar integración continua?**
TBD
