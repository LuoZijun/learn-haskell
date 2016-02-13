Haskell练习
===============

:Date: 02/13 2016

.. contents::

官网: https://www.haskell.org/


包:   https://hackage.haskell.org/


安装环境
-----------

安装 Haskell 编译器:

.. code:: bash

    # OS X
    brew install ghc
    # Linux (Debian)
    sudo apt-get install ghc ghci

Haskell 内建包管理器:

.. code:: bash

    ghc-pkg list

::

    admin@Work ~/.cabal> ghc-pkg list
    WARNING: cache is out of date: /usr/local/Cellar/ghc/7.10.3b/lib/ghc-7.10.3/package.conf.d/package.cache
    ghc will see an old view of this package db. Use 'ghc-pkg recache' to fix.
    /usr/local/Cellar/ghc/7.10.3b/lib/ghc-7.10.3/package.conf.d
       Cabal-1.22.5.0
       array-0.5.1.0
       base-4.8.2.0
       bin-package-db-0.0.0.0
       binary-0.7.5.0
       bytestring-0.10.6.0
       containers-0.5.6.2
       deepseq-1.4.1.1
       directory-1.2.2.0
       filepath-1.4.0.0
       ghc-7.10.3
       ghc-prim-0.4.0.0
       haskeline-0.7.2.1
       hoopl-3.10.0.2
       hpc-0.6.0.2
       integer-gmp-1.0.0.0
       pretty-1.1.2.0
       process-1.2.3.0
       rts-1.0
       template-haskell-2.10.0.0
       terminfo-0.4.0.1
       time-1.5.0.1
       transformers-0.4.2.0
       unix-2.7.1.0
       xhtml-3000.2.1
    /Users/admin/.ghc/x86_64-darwin-7.10.3/package.conf.d
       HTTP-4000.3.3
       mtl-2.2.1
       network-2.6.2.1
       network-uri-2.6.0.3
       parsec-3.1.9
       text-1.2.2.0


Haskell 内建函数包:

.. code:: bash
    
    ghc-pkg list ghc

::

    WARNING: cache is out of date: /usr/local/Cellar/ghc/7.10.3b/lib/ghc-7.10.3/package.conf.d/package.cache
    ghc will see an old view of this package db. Use 'ghc-pkg recache' to fix.
    /usr/local/Cellar/ghc/7.10.3b/lib/ghc-7.10.3/package.conf.d
       ghc-7.10.3
    /Users/admin/.ghc/x86_64-darwin-7.10.3/package.conf.d


找到 `ghc-7.10.3` 这个包（后面的数字是 GHC 版本号，视具体版本而定）：

.. code:: bash

    cabal info ghc-7.10.3

查看 GHC 内建包中的函数函数及模块列表: https://downloads.haskell.org/~ghc/latest/docs/html/libraries/index.html



安装 Hackage 包管理器 cabal:

.. code:: bash

    # OS X
    brew install cabal
    cabal init
    cabal install base HTTP unix network
    # 包缓存在 `~./.cacbl` 目录


代码编译
-----------

编译二进制或者字节码:

.. code:: bash

    ghc -o helloworld helloworld.hs

进入解释器交互模式:

.. code:: bash

    ghci


书籍《Real World Haskell》
------------------------------

*   `Real World Haskell 中文版 <http://cnhaskell.com/index.html>`_
*   `Real World Haskell 英文原版 <http://book.realworldhaskell.org/read/>`_


Haskell 操作符 以及 语法标记
----------------------------

`Haskell Operators and other Lexical Notation <http://www.imada.sdu.dk/~rolf/Edu/DM22/F06/haskell-operatorer.pdf>`_

::

    -- Start of comment line
    {- Start of short comment
    -} End of short comment
    + Add operator
    - Subtract/negate operator
    * Multiply operator
    / Division operator
    Substitution operator, as in e{f/x}
    ^, ^^, ** Raise-to-the-power operators
    && And operator
    || Or operator
    < Less-than operator
    <= Less-than-or-equal operator
    == Equal operator
    /= Not-equal operator
    >= Greater-than-or-equal operator
    > Greater-than operator
    \ Lambda operator
    . Function composition operator
    Name qualifier
    | Guard and case specifier
    Separator in list comprehension
    Alternative in data definition (enum type)
    ++ List concatenation operator
    : Append-head operator (“cons”)
    !! Indexing operator
    .. Range-specifier for lists
    \\ List-difference operator
    <- List comprehension generator
    Single assignment operator in do-constr.
    ; Definition separator
    -> Function type-mapping operator.
    Lambda definition operator
    Separator in case construction
    = Type- or value-naming operator
    :: Type specification operator, “has type”
    => Context inheritance from class
    () Empty value in IO () type
    >> Monad sequencing operator
    >>= Monad sequencing operator with value passing
    >@> Object composition operator (monads)
    (..) Constructor for export operator (postfix)
    [ and ] List constructors, “,” as separator
    ( and ) Tuple constructors, “,” as separator
    Infix-to-prefix constructors
    ‘ and ‘ Prefix-to-infix constructors
    ’ and ’ Literal char constructors
    " and " String constructors
    _ Wildcard in pattern
    ~ Irrefutable pattern
    ! Force evaluation (strictness flag)
    @ “Read As” in pattern matching


内建函数（Built-in Functions）
-------------------------------

参考:
    
*   `GHC <https://www.haskell.org/ghc/>`_
*   `GHC Libraries <https://downloads.haskell.org/~ghc/latest/docs/html/libraries/index.html>`_
*   `Prelude.hs <http://www.cse.unsw.edu.au/~en1000/haskell/inbuilt.html>`_


`《The Glorious Glasgow Haskell Compilation System User's Guide, Version 6.6》 <https://downloads.haskell.org/~ghc/6.6/docs/html/users_guide/index.html>`_ 中提到的 `GHC Libraries`:

*   `Core Libraries <https://downloads.haskell.org/~ghc/6.6/docs/html/users_guide/release-6-6.html#id3117420>`_
*   `Extra Libraries <https://downloads.haskell.org/~ghc/6.6/docs/html/users_guide/release-6-6.html#id3120383>`_


内建类型和类（Predefined Types and Classes）
----------------------------------------------

参考:

*   `Predefined Types and Classes <https://www.haskell.org/onlinereport/basic.html>`_


高阶函数（Higher Order Functions）
--------------------------------------

参考： `Higher order functions - map, fold and filter <http://www.cse.unsw.edu.au/~en1000/haskell/hof.html>`_


你好，世界
------------

.. code:: haskell
    
    import System.IO

    main = do
        System.IO.putStrLn "Hello, 世界！"
        System.IO.putStr "Hello, 世界！\n"


