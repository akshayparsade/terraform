
    #!/bin/bash
    apt install httpd -y
    systemctl start httpd
    systemctl enable httpd
    mkdir /var/www/html/cloth
    echo "<h1> This is Clothing Page </h1> <br> <h2> SALE ! SALE ! SALE !! </h2> > /var/www/html/cloth/index.html 
    EOF 