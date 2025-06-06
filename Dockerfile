FROM containers.intersystems.com/intersystems/irishealth-community:2025.1

USER irisowner

#COPY . .
#RUN pip3 install -r requirements.txt
#Or, used this to replace pip package source in China
#RUN pip3 install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

RUN find . -name '.DS_Store' -type f -delete

WORKDIR /irisdev
COPY --chown=irisowner:irisowner --chmod=700 init /irisdev/init
COPY --chown=irisowner:irisowner --chmod=700 src /irisdev/src

WORKDIR /irisdev/init



RUN iris start IRIS \
    && iris session IRIS < iris.script \
    && iris stop IRIS quietly