FROM ubuntu:latest

COPY task.yml .

COPY wordpress.sh .

RUN apt-get update; \
    apt install python3-pip -y; \
    pip install boto boto3; \
    python3 -m pip install ansible; \
    python3 -m pip install awscli; \
    apt-get install python-boto -y; \
    export AWS_ACCESS_KEY_ID=AKIA4MI5MKCHURQZMGXG; \
    export AWS_SECRET_ACCESS_KEY=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; \
    export AWS_DEFAULT_REGION=us-west-2

CMD ["ansible-playbook","task.yml"]
