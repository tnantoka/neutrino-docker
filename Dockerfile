FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
  libgomp1

CMD ["./Run.sh"]
