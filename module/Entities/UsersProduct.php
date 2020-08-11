<?php

namespace Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * UsersProduct
 *
 * @ORM\Table(name="users_product", indexes={@ORM\Index(name="user_id", columns={"user_id"}), @ORM\Index(name="product_id", columns={"product_id"})})
 * @ORM\Entity
 */
class UsersProduct
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dt_created", type="datetime", nullable=false)
     */
    private $dtCreated = 'CURRENT_TIMESTAMP';

    /**
     * @var \Album\Entity\Users
     *
     * @ORM\ManyToOne(targetEntity="Album\Entity\Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     * })
     */
    private $user;

    /**
     * @var \Album\Entity\Products
     *
     * @ORM\ManyToOne(targetEntity="Album\Entity\Products")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="product_id", referencedColumnName="id")
     * })
     */
    private $product;


}

