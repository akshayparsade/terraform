
    #!/bin/bash
    apt install httpd -y
    systemctl start httpd
    systemctl enable httpd
    mkdir /var/www/html/laptop
    echo "<h1> This is laptop Page </h1> <br> <h2> Welcome to laptops </h2> > /var/www/html/laptop/index.html 
 