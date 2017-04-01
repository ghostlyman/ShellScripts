define host{
        host_name               NYCadsRedis01
        alias                   PRD ADS NYC ADS Redis Server(HLS)
        address                 NYCadsRedis01.fwmrm.net
        hostgroups              LINUX_RHEL7,REDI,check_memcached_ads
        use                     linux-server
        }

define host{
        host_name               NYCadsRedis02
        alias                   PRD ADS NYC ADS Redis Server(HLS) monitor node
        address                 NYCadsRedis02.fwmrm.net
        hostgroups              LINUX_RHEL7,REDI,ADS_REDIS,check_memcached_ads
        use                     linux-server
        }

define host{
        host_name               SVLadsRedis01
        alias                   PRD ADS SVL ADS Redis Server(HLS)
        address                 SVLadsRedis01.fwmrm.net
        hostgroups              LINUX_RHEL7,REDI,SVL-IBX,check_memcached_ads
        use                     linux-server
        }

define host{
        host_name               SVLadsRedis02
        alias                   PRD ADS SVL ADS Redis Server(HLS) monitor node
        address                 SVLadsRedis02.fwmrm.net
        hostgroups              LINUX_RHEL7,REDI,ADS_REDIS,SVL-IBX,check_memcached_ads
        use                     linux-server
        }

define host{
        host_name               AMSadsRedis01
        alias                   PRD ADS AMS ADS Redis Server(HLS)
        address                 AMSadsRedis01.fwmrm.net
        hostgroups              LINUX_RHEL7,REDI,AMS-EQX,check_memcached_ads
        use                     linux-server
        }

define host{
        host_name               AMSadsRedis02
        alias                   PRD ADS AMS ADS Redis Server(HLS) monitor node
        address                 AMSadsRedis02.fwmrm.net
        hostgroups              LINUX_RHEL7,REDI,ADS_REDIS,AMS-EQX,check_memcached_ads
        use                     linux-server
        }

define host{
        host_name               LAXadsRedis01
        alias                   PRD ADS LAX ADS Redis Server(HLS)
        address                 LAXadsRedis01.fwmrm.net
        hostgroups              LINUX_RHEL7,REDI,LAX-EQX
        use                     linux-server
        }

define host{
        host_name               LAXadsRedis02
        alias                   PRD ADS LAX ADS Redis Server(HLS) monitor node
        address                 LAXadsRedis02.fwmrm.net
        hostgroups              LINUX_RHEL7,REDI,ADS_REDIS,LAX-EQX
        use                     linux-server
        }

define host{
        host_name               LONadsRedis01
        alias                   PRD ADS LON ADS Redis Server(HLS)
        address                 LONadsRedis01.fwmrm.net
        hostgroups              LINUX_RHEL7,REDI,LON-LEV3,check_memcached_ads
        use                     linux-server
        }

define host{
        host_name               LONadsRedis02
        alias                   PRD ADS LON ADS Redis Server(HLS) monitor node
        address                 LONadsRedis02.fwmrm.net
        hostgroups              LINUX_RHEL7,REDI,ADS_REDIS,LON-LEV3,check_memcached_ads
        use                     linux-server
        }

define host{
        host_name               ASHadsRedis01
        alias                   PRD ADS ASH ADS Redis Server(HLS)
        address                 ASHadsRedis01.fwmrm.net
        hostgroups              LINUX_RHEL7,REDI,ASH-EQX,check_memcached_ads
        use                     linux-server
        }

define host{
        host_name               ASHadsRedis02
        alias                   PRD ADS ASH ADS Redis Server(HLS) monitor node
        address                 ASHadsRedis02.fwmrm.net
        hostgroups              LINUX_RHEL7,REDI,ADS_REDIS,ASH-EQX,check_memcached_ads
        use                     linux-server
        }

