<?php
/**
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2016 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application\Controller;


use Entities\Repositories\RootRepository;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Doctrine\ORM\Query\ResultSetMapping;

class IndexController extends AbstractActionController
{
    protected $container;

    public function __construct($container = null)
    {
        $this->container = $container;
    }

    public function indexAction()
    {
        $em=$this->container->get('Doctrine\ORM\EntityManager');
        $rootRepos=new RootRepository($em);
        $books=$rootRepos->getLastOrderUsers();

        return new ViewModel(['books'=>$books]);
    }
}
