
FROM python:3.8.5
# streamlit-specific commands
RUN mkdir -p /root/.streamlit
RUN bash -c 'echo -e "\
[general]\n\
email = \"ziadi.mahdi.tn@gmail.com\"\n\
" > /root/.streamlit/credentials.toml'
RUN bash -c 'echo -e "\
[server]\n\
enableCORS = false\n\"
/root/.streamlit/config.toml' 
# exposing default port for streamlit
# heroku will ignore even if it's there
EXPOSE 8501

# making directory of app
WORKDIR /app

# copy over requirements
COPY requirements.txt ./requirements.txt
 
# install pip then packages
RUN pip install -r requirements.txt
RUN pip3 install libglib2.0-0
RUN pip3 install libsm6
RUN pip3 install libxext6
RUN pip3 install libxrender-dev
 
# copying all files over
COPY . .
 
# cmd to launch app when container is run
CMD streamlit run app.py --server.port $PORT