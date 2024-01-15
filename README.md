# Template per repository principale

Questo repository viene utilizzato come template.

## Installazione

### Requisiti
- [Docker Compose](https://docs.docker.com/compose/)
- [Make](https://www.gnu.org/software/make/manual/)

```bash
make install
```

Con questo comando viene installato localmente il progetto.

> Prima di lanciare il comando controllare il file `.env.example` nella root del progetto per controllare che le porte
esposte da `docker-compose` siano libere sulla propria macchina.
In caso qualche valore non torni copiare a mano il file e cambiare i valori a seconda delle proprie esigenze.
