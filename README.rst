Haskell练习
===============

:Date: 02/13 2016

.. contents::

官网: https://www.haskell.org/


包:   https://hackage.haskell.org/


学习资料:

*   `Real World Haskell 中文版 <http://cnhaskell.com/index.html>`_
*   `Real World Haskell 英文原版 <http://book.realworldhaskell.org/read/>`_

安装环境
-----------

安装 Haskell 编译器:

.. code:: bash

    # OS X
    brew install ghc
    # Linux (Debian)
    sudo apt-get install ghc ghci

安装 Hackage 包管理器 opam:

.. code:: bash

    # OS X
    brew install opam
    opam update
    opam install core network


代码编译
-----------

编译二进制或者字节码:

.. code:: bash

    ghc -o helloworld helloworld.hs

进入解释器交互模式:

.. code:: bash

    ghci


你好，世界
------------

.. code:: haskell
    
    import System.IO

    main = do
        System.IO.putStrLn "Hello, 世界！"
        System.IO.putStr "Hello, 世界！\n"


